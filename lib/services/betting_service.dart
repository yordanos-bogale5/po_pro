import 'package:cloud_firestore/cloud_firestore.dart';
import '../constants/game_constants.dart';


class BettingService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> placeBet(String roomId, String playerId, int amount) async {
    DocumentSnapshot gameSnapshot =
        await _firestore.collection('rooms').doc(roomId).get();

    if (gameSnapshot.exists) {
      Map<String, dynamic> data = gameSnapshot.data() as Map<String, dynamic>;
      Map<String, int> playerBalances =
          Map<String, int>.from(data['playerBalances']);
      int currentPot = data['pot'] ?? 0;

      if (playerBalances[playerId]! >= amount) {
        // Deduct bet amount from player's balance
        playerBalances[playerId] = playerBalances[playerId]! - amount;

        // Add amount to the pot
        currentPot += amount;

        // Update Firebase
        await _firestore.collection('rooms').doc(roomId).update({
          'playerBalances': playerBalances,
          'pot': currentPot,
          'lastBet': {
            'playerId': playerId,
            'amount': amount,
            'action': GameConstants.actionBet,
            'timestamp': FieldValue.serverTimestamp(),
          }
        });
      }
    }
  }

  Future<void> raiseBet(String roomId, String playerId, int amount) async {
    await placeBet(roomId, playerId, amount);
    await _firestore.collection('rooms').doc(roomId).update({
      'lastBet.action': GameConstants.actionRaise,
    });
  }

  Future<void> callBet(String roomId, String playerId, int amount) async {
    await placeBet(roomId, playerId, amount);
    await _firestore.collection('rooms').doc(roomId).update({
      'lastBet.action': GameConstants.actionCall,
    });
  }

  Future<void> fold(String roomId, String playerId) async {
    await _firestore.collection('rooms').doc(roomId).update({
      'lastBet': {
        'playerId': playerId,
        'action': GameConstants.actionFold,
        'timestamp': FieldValue.serverTimestamp(),
      }
    });
  }
}
