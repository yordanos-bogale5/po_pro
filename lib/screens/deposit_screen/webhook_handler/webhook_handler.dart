import 'package:cloud_firestore/cloud_firestore.dart';

class WebhookHandler {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Handle Coinbase webhook for successful payments
  Future<void> handlePaymentSuccess(String userId, double amount) async {
    // Update user balance in Firestore
    await _firestore.collection('users').doc(userId).update({
      'balance': FieldValue.increment(amount),
      'transaction_history': FieldValue.arrayUnion([
        {
          'type': 'deposit',
          'amount': amount,
          'status': 'completed',
          'date': DateTime.now().toIso8601String(),
        }
      ])
    });
  }
}
