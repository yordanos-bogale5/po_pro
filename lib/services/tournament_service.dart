import 'package:cloud_firestore/cloud_firestore.dart';

class TournamentService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Create a new tournament in Firestore
  Future<void> createTournament(String tournamentId, String type, List<String> players) async {
    await _firestore.collection('tournaments').doc(tournamentId).set({
      'type': type,
      'players': players,
      'currentRound': 1,
      'pot': 0,
      'status': 'ongoing',
      'winner': '',
    });
  }

  // Eliminate a player from the tournament (for Knockout and Classic)
  Future<void> eliminatePlayer(String tournamentId, String playerId) async {
    DocumentSnapshot tournamentSnapshot = await _firestore.collection('tournaments').doc(tournamentId).get();

    if (tournamentSnapshot.exists) {
      // Correctly cast the data to a Map<String, dynamic>
      Map<String, dynamic> data = tournamentSnapshot.data() as Map<String, dynamic>;
      List<String> players = List<String>.from(data['players'] ?? []);
      players.remove(playerId);

      await _firestore.collection('tournaments').doc(tournamentId).update({
        'players': players,
      });

      if (players.length == 1) {
        // The remaining player is the winner
        await declareWinner(tournamentId, players.first);
      }
    }
  }

  // Distribute winnings for Heads-Up tournaments
  Future<void> distributeWinningsForHeadsUp(String tournamentId) async {
    DocumentSnapshot tournamentSnapshot = await _firestore.collection('tournaments').doc(tournamentId).get();

    if (tournamentSnapshot.exists) {
      // Correctly cast the data to a Map<String, dynamic>
      Map<String, dynamic> data = tournamentSnapshot.data() as Map<String, dynamic>;
      List<String> players = List<String>.from(data['players'] ?? []);
      int pot = data['pot'] ?? 0;
      String winner = data['winner'] ?? '';

      // In a Heads-Up tournament, the winner gets 90% of the pot
      if (players.length == 2 && winner.isNotEmpty) {
        int winnerShare = (pot * 0.9).toInt();
        int loserShare = pot - winnerShare;

        // Update Firebase balances here
        // Update player balances with the winner's and loser's share
      }
    }
  }

  // Declare the winner of the tournament
  Future<void> declareWinner(String tournamentId, String winnerId) async {
    try {
      // Update Firestore to set the winner for the tournament
      await _firestore.collection('tournaments').doc(tournamentId).update({
        'status': 'completed',
        'winner': winnerId,
      });
    } catch (e) {
      print("Error declaring winner: $e");
    }
  }

  // Update the pot for the tournament
  Future<void> updatePot(String tournamentId, int amount) async {
    DocumentSnapshot tournamentSnapshot = await _firestore.collection('tournaments').doc(tournamentId).get();

    if (tournamentSnapshot.exists) {
      // Correctly cast the data to a Map<String, dynamic>
      Map<String, dynamic> data = tournamentSnapshot.data() as Map<String, dynamic>;
      int currentPot = data['pot'] ?? 0;
      await _firestore.collection('tournaments').doc(tournamentId).update({
        'pot': currentPot + amount,
      });
    }
  }

  // Start a new round
  Future<void> nextRound(String tournamentId) async {
    DocumentSnapshot tournamentSnapshot = await _firestore.collection('tournaments').doc(tournamentId).get();

    if (tournamentSnapshot.exists) {
      // Correctly cast the data to a Map<String, dynamic>
      Map<String, dynamic> data = tournamentSnapshot.data() as Map<String, dynamic>;
      int currentRound = data['currentRound'] ?? 0;
      await _firestore.collection('tournaments').doc(tournamentId).update({
        'currentRound': currentRound + 1,
      });
    }
  }
}
