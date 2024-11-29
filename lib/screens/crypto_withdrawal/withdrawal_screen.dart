import 'package:flutter/material.dart';
import 'crypto_withdrawal_service.dart';

class WithdrawalScreen extends StatefulWidget {
  final String userId;

  WithdrawalScreen({required this.userId});

  @override
  _WithdrawalScreenState createState() => _WithdrawalScreenState();
}

class _WithdrawalScreenState extends State<WithdrawalScreen> {
  final _amountController = TextEditingController();
  final _walletAddressController = TextEditingController();
  bool _isLoading = false;
  String _statusMessage = '';

  // Function to handle withdrawal request
  void _handleWithdrawal() async {
    setState(() {
      _isLoading = true;
      _statusMessage = '';
    });

    final amount = double.tryParse(_amountController.text) ?? 0.0;
    final walletAddress = _walletAddressController.text;

    if (amount <= 0 || walletAddress.isEmpty) {
      setState(() {
        _statusMessage = "Please enter a valid amount and wallet address.";
        _isLoading = false;
      });
      return;
    }

    final withdrawalService = CryptoWithdrawalService(widget.userId);
    String message = await withdrawalService.initiateWithdrawal(amount, walletAddress);

    setState(() {
      _statusMessage = message;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Withdraw Cryptocurrency")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _amountController,
              decoration: const InputDecoration(
                labelText: "Amount to Withdraw (BTC)",
                prefixIcon: Icon(Icons.monetization_on),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _walletAddressController,
              decoration: const InputDecoration(
                labelText: "Wallet Address",
                prefixIcon: Icon(Icons.account_balance_wallet),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isLoading ? null : _handleWithdrawal,
              child: _isLoading
                  ? const CircularProgressIndicator()
                  : const Text("Withdraw"),
            ),
            const SizedBox(height: 20),
            Text(
              _statusMessage,
              style: const TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
