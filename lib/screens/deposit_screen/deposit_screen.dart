import 'package:flutter/material.dart';
import 'package:poker_project/screens/deposit_screen/webview_page.dart';
import 'package:poker_project/services/crypto_payment_service.dart';


class DepositScreen extends StatefulWidget {
  final String userId;

  const DepositScreen({super.key, required this.userId});

  @override
  _DepositScreenState createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {
  final CryptoPaymentService _cryptoPaymentService = CryptoPaymentService();
  bool _isLoading = false;
  String _paymentUrl = '';

  // Function to handle deposit request
  void _handleDeposit(double amount) async {
    setState(() {
      _isLoading = true;
    });

    try {
      String url = await _cryptoPaymentService.createPaymentRequest(amount);
      setState(() {
        _paymentUrl = url;
      });

      // Navigate to the Coinbase payment URL
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WebViewPage(url: _paymentUrl)),
      );
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
      // Handle error (e.g., show a message)
      print(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Deposit Cryptocurrency")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: "Enter amount to deposit (USD)"),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                // You can store the entered amount
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isLoading ? null : () => _handleDeposit(50), // Example amount
              child: _isLoading
                  ? const CircularProgressIndicator()
                  : const Text("Deposit"),
            ),
          ],
        ),
      ),
    );
  }
}
