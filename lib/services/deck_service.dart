import 'dart:math';

class DeckService {
  final List<String> _deck = [
    'AS', '2S', '3S', '4S', '5S', '6S', '7S', '8S', '9S', '10S', 'JS', 'QS', 'KS',
    'AH', '2H', '3H', '4H', '5H', '6H', '7H', '8H', '9H', '10H', 'JH', 'QH', 'KH',
    'AD', '2D', '3D', '4D', '5D', '6D', '7D', '8D', '9D', '10D', 'JD', 'QD', 'KD',
    'AC', '2C', '3C', '4C', '5C', '6C', '7C', '8C', '9C', '10C', 'JC', 'QC', 'KC',
  ];

  List<String> shuffleDeck() {
    final random = Random();
    for (int i = _deck.length - 1; i > 0; i--) {
      int j = random.nextInt(i + 1);
      String temp = _deck[i];
      _deck[i] = _deck[j];
      _deck[j] = temp;
    }
    return List<String>.from(_deck); // Return shuffled deck
  }

  Map<String, List<String>> dealCards(int numberOfPlayers) {
    List<String> shuffledDeck = shuffleDeck();

    // Deal cards to players
    Map<String, List<String>> playersHands = {};
    for (int i = 0; i < numberOfPlayers; i++) {
      playersHands['Player${i + 1}'] = shuffledDeck.sublist(i * 2, (i * 2) + 2);
    }

    return playersHands;
  }
}
