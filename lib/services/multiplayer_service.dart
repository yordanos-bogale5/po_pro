import 'package:cloud_firestore/cloud_firestore.dart';

import '../poker_hand_evaluation_logic/poker_hand_evaluator.dart';


class MultiplayerGameService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  Future<void> distributePot(String roomId) async {
    DocumentSnapshot gameSnapshot =
        await _firestore.collection('rooms').doc(roomId).get();

    if (!gameSnapshot.exists) return;

    Map<String, dynamic> gameData = gameSnapshot.data() as Map<String, dynamic>;
    String winner = gameData['winner'];
    int pot = gameData['pot'] ?? 0;
    Map<String, int> playerBalances = Map<String, int>.from(gameData['playerBalances']);

    if (winner.isNotEmpty && playerBalances.containsKey(winner)) {
      // Add the pot amount to the winner's balance
      playerBalances[winner] = playerBalances[winner]! + pot;

      // Reset the pot
      await _firestore.collection('rooms').doc(roomId).update({
        'playerBalances': playerBalances,
        'pot': 0,
        'gameState': 'waiting', // Reset game state
        'winner': '', // Reset winner
      });
    }
  }

   // Update the timer value in Firebase
  Future<void> updateTimer(String roomId, int remainingTime) async {
    await _firestore.collection('rooms').doc(roomId).update({
      'bettingRoundRemainingTime': remainingTime,
    });
  }

  // Reset the timer for a new betting round
  Future<void> resetTimer(String roomId) async {
    await _firestore.collection('rooms').doc(roomId).update({
      'bettingRoundRemainingTime': 30, // Reset to 30 seconds
    });
  }

  Future<void> evaluateAndSetWinner(String roomId) async {
    DocumentSnapshot gameSnapshot =
        await _firestore.collection('rooms').doc(roomId).get();

    Map<String, dynamic> gameData =
        gameSnapshot.data() as Map<String, dynamic>;
    Map<String, List<String>> playersHands =
        Map<String, List<String>>.from(gameData['playersHands']);

    String winner = '';
    int bestHandValue = 0;

    playersHands.forEach((player, hand) {
      int handValue = PokerHandEvaluator.evaluateHand(hand);
      if (handValue > bestHandValue) {
        bestHandValue = handValue;
        winner = player;
      }
    });

    await _firestore.collection('rooms').doc(roomId).update({
      'winner': winner,
      'gameState': 'completed',
    });
  }

  joinOrCreateRoom(double buyInAmount) {}
}
