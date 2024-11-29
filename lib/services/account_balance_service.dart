import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AccountBalanceService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<double> getAccountBalance() async {
    final userId = _auth.currentUser?.uid;

    if (userId != null) {
      DocumentSnapshot snapshot =
          await _firestore.collection('users').doc(userId).get();

      if (snapshot.exists && snapshot.data() != null) {
        return (snapshot.data() as Map<String, dynamic>)['balance'] ?? 0.0;
      }
    }
    return 0.0;
  }

  Future<void> updateAccountBalance(double amount) async {
    final userId = _auth.currentUser?.uid;

    if (userId != null) {
      await _firestore.collection('users').doc(userId).update({
        'balance': FieldValue.increment(amount),
      });
    }
  }

  Future<void> initializeAccountBalance() async {
    final userId = _auth.currentUser?.uid;

    if (userId != null) {
      DocumentReference userDoc = _firestore.collection('users').doc(userId);

      DocumentSnapshot snapshot = await userDoc.get();

      if (!snapshot.exists) {
        await userDoc.set({'balance': 1000.0}); // Initial balance of 1000
      }
    }
  }
}
