import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';

class CryptoWithdrawalService {
  final String apiKey = "YOUR_COINBASE_API_KEY"; // Replace with your API key
  final String apiSecret = "YOUR_COINBASE_API_SECRET"; // Replace with your API secret
  final String userId;

  CryptoWithdrawalService(this.userId);

  // Function to withdraw cryptocurrency
  Future<String> initiateWithdrawal(double amount, String walletAddress) async {
    // Check if the player has enough balance in Firebase
    final userDoc = await FirebaseFirestore.instance.collection('users').doc(userId).get();
    double balance = userDoc['balance'];

    if (balance < amount) {
      return "Insufficient funds";
    }

    final url = Uri.parse('https://api.coinbase.com/v2/accounts/primary/withdrawals');
    
    final requestBody = jsonEncode({
      "amount": amount.toString(),
      "currency": "BTC", // Specify the cryptocurrency, e.g., BTC
      "address": walletAddress,
      "memo": "Poker Game Withdrawal"
    });

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey', // Include your Coinbase API key
      },
      body: requestBody,
    );

    if (response.statusCode == 200) {
      // Update balance in Firebase (reduce by withdrawal amount)
      await FirebaseFirestore.instance.collection('users').doc(userId).update({
        'balance': FieldValue.increment(-amount), // Decrease balance
        'transaction_history': FieldValue.arrayUnion([
          {
            'type': 'withdrawal',
            'amount': amount,
            'status': 'pending',
            'date': DateTime.now().toIso8601String(),
          }
        ])
      });

      return "Withdrawal successful, processing...";
    } else {
      return "Failed to initiate withdrawal: ${response.body}";
    }
  }
}
