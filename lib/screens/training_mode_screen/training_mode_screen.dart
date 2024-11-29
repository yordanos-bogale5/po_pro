import 'dart:math';
import 'package:flutter/material.dart';
import 'package:poker_project/services/account_balance_service.dart';

class TrainingModeScreen extends StatefulWidget {
  const TrainingModeScreen({super.key});

  @override
  _TrainingModeScreenState createState() => _TrainingModeScreenState();
}

class _TrainingModeScreenState extends State<TrainingModeScreen> {
  final List<String> _deck = [];
  List<String> _playerHand = [];
  List<String> _tableCards = [];

  @override
  void initState() {
    super.initState();
    _initializeDeck();
    _shuffleAndDeal();
  }

  // Initialize a standard deck of 52 cards
  void _initializeDeck() {
    final suits = ['♠', '♥', '♦', '♣'];
    final ranks = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A'];
    _deck.clear();
    for (var suit in suits) {
      for (var rank in ranks) {
        _deck.add('$rank$suit');
      }
    }
  }

  // Shuffle the deck and deal 2 cards to the player and 5 to the table
  void _shuffleAndDeal() {
    _deck.shuffle(Random.secure()); // Secure shuffle
    _playerHand = [_deck.removeLast(), _deck.removeLast()];
    _tableCards = [_deck.removeLast(), _deck.removeLast(), _deck.removeLast(), _deck.removeLast(), _deck.removeLast()];
  }

  // Reset and redeal cards
  void _resetGame() {
    setState(() {
      _initializeDeck();
      _shuffleAndDeal();
    });
  }

  void _updateBalanceAfterGame(bool isWin) async {
  double amount = isWin ? 100.0 : -50.0; // Example: +100 for win, -50 for loss
  await AccountBalanceService().updateAccountBalance(amount);
  
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Training Mode"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Your Hand:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _playerHand.map((card) => _buildCardWidget(card)).toList(),
            ),
            const SizedBox(height: 20),
            const Text(
              "Table Cards:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _tableCards.map((card) => _buildCardWidget(card)).toList(),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _resetGame,
                  child: const Text("Redeal"),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Placeholder for betting logic
                  },
                  child: const Text("Bet"),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Placeholder for folding logic
                  },
                  child: const Text("Fold"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build a card widget
  Widget _buildCardWidget(String card) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        card,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
