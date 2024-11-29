import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HandsReplayScreen extends StatelessWidget {
  final String roomId;

  HandsReplayScreen(this.roomId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hands Replay"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('rooms')
            .doc(roomId)
            .collection('hands')
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();

          final hands = snapshot.data!.docs;

          return ListView.builder(
            itemCount: hands.length,
            itemBuilder: (context, index) {
              final data = hands[index].data() as Map<String, dynamic>;
              return Card(
                child: ListTile(
                  title: Text("Hand: ${data['playerHand']}"),
                  subtitle: Text("Result: ${data['result']}"),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
