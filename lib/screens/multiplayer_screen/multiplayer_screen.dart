import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MultiplayerScreen extends StatefulWidget {
  const MultiplayerScreen({super.key});

  @override
  _MultiplayerScreenState createState() => _MultiplayerScreenState();
}

class _MultiplayerScreenState extends State<MultiplayerScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> joinRoom() async {
    final currentUser = _auth.currentUser;
    await _firestore.collection('rooms').add({
      'userId': currentUser?.uid,
      'status': 'waiting',
    });
    // Navigate to room screen or game screen
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Multiplayer"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: joinRoom,
          child: const Text("Join Room"),
        ),
      ),
    );
  }
}
