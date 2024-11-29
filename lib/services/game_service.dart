import 'package:cloud_firestore/cloud_firestore.dart';
import 'deck_service.dart';

class GameService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final DeckService _deckService = DeckService();

  Future<void> startNewGame(String roomId, int numberOfPlayers) async {
    // Shuffle and deal cards
    Map<String, List<String>> playersHands = _deckService.dealCards(numberOfPlayers);

    // Upload game state to Firebase
    await _firestore.collection('rooms').doc(roomId).set({
      'gameState': 'active',
      'playersHands': playersHands,
      'deck': _deckService.shuffleDeck(),
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  Future<void> updatePlayerMove(String roomId, String playerId, String move) async {
    await _firestore.collection('rooms').doc(roomId).update({
      'lastMove': {
        'playerId': playerId,
        'move': move,
        'timestamp': FieldValue.serverTimestamp(),
      },
    });
  }
}
