class PokerHandEvaluator {
  static const List<String> ranks = [
    '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A'
  ];
  static const List<String> suits = ['S', 'H', 'D', 'C'];

  static int evaluateHand(List<String> hand) {
    // Sort hand by rank
    hand.sort((a, b) => ranks.indexOf(a.substring(0, a.length - 1))
        .compareTo(ranks.indexOf(b.substring(0, b.length - 1))));

    if (isRoyalFlush(hand)) return 10;
    if (isStraightFlush(hand)) return 9;
    if (isFourOfAKind(hand)) return 8;
    if (isFullHouse(hand)) return 7;
    if (isFlush(hand)) return 6;
    if (isStraight(hand)) return 5;
    if (isThreeOfAKind(hand)) return 4;
    if (isTwoPair(hand)) return 3;
    if (isOnePair(hand)) return 2;
    return 1; // High Card
  }

  static bool isRoyalFlush(List<String> hand) {
    return isStraightFlush(hand) && hand.contains('AS');
  }

  static bool isStraightFlush(List<String> hand) {
    return isStraight(hand) && isFlush(hand);
  }

  static bool isFourOfAKind(List<String> hand) {
    Map<String, int> rankCount = _getRankCount(hand);
    return rankCount.values.contains(4);
  }

  static bool isFullHouse(List<String> hand) {
    Map<String, int> rankCount = _getRankCount(hand);
    return rankCount.values.contains(3) && rankCount.values.contains(2);
  }

  static bool isFlush(List<String> hand) {
    String suit = hand.first.substring(hand.first.length - 1);
    return hand.every((card) => card.endsWith(suit));
  }

  static bool isStraight(List<String> hand) {
    List<int> rankIndices = hand.map((card) => ranks.indexOf(card.substring(0, card.length - 1))).toList();
    for (int i = 0; i < rankIndices.length - 1; i++) {
      if (rankIndices[i] + 1 != rankIndices[i + 1]) return false;
    }
    return true;
  }

  static bool isThreeOfAKind(List<String> hand) {
    Map<String, int> rankCount = _getRankCount(hand);
    return rankCount.values.contains(3);
  }

  static bool isTwoPair(List<String> hand) {
    Map<String, int> rankCount = _getRankCount(hand);
    return rankCount.values.where((count) => count == 2).length == 2;
  }

  static bool isOnePair(List<String> hand) {
    Map<String, int> rankCount = _getRankCount(hand);
    return rankCount.values.contains(2);
  }

  static Map<String, int> _getRankCount(List<String> hand) {
    Map<String, int> rankCount = {};
    for (String card in hand) {
      String rank = card.substring(0, card.length - 1);
      rankCount[rank] = (rankCount[rank] ?? 0) + 1;
    }
    return rankCount;
  }
}
