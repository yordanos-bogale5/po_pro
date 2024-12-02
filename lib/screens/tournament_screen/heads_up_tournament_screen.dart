import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore
import 'package:poker_project/screens/game_screen/poker_game_screen.dart';
import 'package:poker_project/services/multiplayer_service.dart';

class HeadsUpTournamentScreen extends StatefulWidget {
  const HeadsUpTournamentScreen({super.key});

  @override
  _HeadsUpTournamentScreenState createState() => _HeadsUpTournamentScreenState();
}

class _HeadsUpTournamentScreenState extends State<HeadsUpTournamentScreen> {
  final MultiplayerGameService _multiplayerService = MultiplayerGameService();
  final double _buyInAmount = 100.0;
  String _statusMessage = "Waiting for an opponent...";

  // Define a Firestore instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _joinHeadsUpTournament() async {
    String roomId = await _multiplayerService.joinOrCreateRoom(_buyInAmount);
    setState(() {
      _statusMessage = "Joined Room: $roomId. Waiting for another player...";
    });

    // Listen for game start
    _firestore.collection('rooms').doc(roomId).snapshots().listen((snapshot) {
      if (snapshot.data()?['isFull'] == true) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PokerGameScreen(
              roomId: roomId,
              playerId: '', // Pass the playerId dynamically if available
              tournamentId: '', // Pass the tournamentId dynamically if available
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Heads-Up Tournament"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _joinHeadsUpTournament,
              child: Text("Join Heads-Up Tournament (\$$_buyInAmount)"),
            ),
            const SizedBox(height: 20),
            Text(_statusMessage),
          ],
        ),
      ),
    );
  }
}
