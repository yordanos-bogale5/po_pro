import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'poker_game_screen.dart'; 

class HomeScreen extends StatelessWidget {
  final String playerId; // Player's ID, which can be passed from login
  final String tournamentId = "defaultTournamentId"; // Default or dynamic tournament ID

  const HomeScreen({super.key, required this.playerId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PokerKing - Home"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display Account Balance
            FutureBuilder<double>(
              future: _getAccountBalance(playerId), // Fetch account balance from Firebase
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                }
                final balance = snapshot.data ?? 0.0;
                return Text(
                  "Account Balance: \$${balance.toStringAsFixed(2)}",
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                );
              },
            ),
            const SizedBox(height: 40),
            // Navigate to Poker Game Screen
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PokerGameScreen(
                      roomId: 'defaultRoomId', 
                      playerId: playerId,
                      tournamentId: tournamentId,
                    ),
                  ),
                );
              },
              child: const Text(
                "Join Poker Game",
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),
            // Start Heads-Up Tournament (1vs1)
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PokerGameScreen(
                      roomId: 'headsUpRoom',
                      playerId: playerId,
                      tournamentId: tournamentId,
                    ),
                  ),
                );
              },
              child: const Text(
                "Start Heads-Up Tournament (1vs1)",
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),
            // Button to View Tournaments
            ElevatedButton(
              onPressed: () {
                // Navigate to a future TournamentScreen
                Navigator.pushNamed(context, '/tournamentScreen');
              },
              child: const Text(
                "View Tournaments",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<double> _getAccountBalance(String playerId) async {
    // Fetch account balance from Firebase or other logic
    final snapshot = await FirebaseFirestore.instance.collection('players').doc(playerId).get();
    return snapshot.exists ? (snapshot.data()?['balance'] ?? 0.0) as double : 0.0;
  }
}
