import 'package:flutter/material.dart';
import 'package:poker_project/services/account_balance_service.dart';


class TournamentScreen extends StatefulWidget {
  const TournamentScreen({super.key});

  @override
  _TournamentScreenState createState() => _TournamentScreenState();
}

class _TournamentScreenState extends State<TournamentScreen> {
  final AccountBalanceService _balanceService = AccountBalanceService();
  double _balance = 0.0;

  @override
  void initState() {
    super.initState();
    _loadAccountBalance();
  }

  Future<void> _loadAccountBalance() async {
    double balance = await _balanceService.getAccountBalance();
    setState(() {
      _balance = balance;
    });
  }

  Future<void> _joinTournament(double buyIn) async {
    if (_balance >= buyIn) {
      await _balanceService.updateAccountBalance(-buyIn);
      _loadAccountBalance();
      _showDialog("Success", "You have joined the tournament!");
    } else {
      _showDialog("Insufficient Funds", "You don't have enough balance.");
    }
  }

  void _showDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tournaments"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              "Account Balance: \$$_balance",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildTournamentCard("Knockout Tournament", 50.0, "Win 90% of the pool!"),
            _buildTournamentCard("Classic Poker Tournament", 100.0, "Win big prizes!"),
          ],
        ),
      ),
    );
  }

  Widget _buildTournamentCard(String title, double buyIn, String description) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        title: Text(title),
        subtitle: Text(description),
        trailing: ElevatedButton(
          onPressed: () => _joinTournament(buyIn),
          child: Text("Join (\$${buyIn.toStringAsFixed(2)})"),
        ),
      ),
    );
  }
}
