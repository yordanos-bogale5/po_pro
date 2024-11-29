import 'package:flutter/material.dart';
import 'package:poker_project/services/betting_service.dart';


class PokerBettingWidget extends StatefulWidget {
  final String roomId;
  final String playerId;

  const PokerBettingWidget({super.key, required this.roomId, required this.playerId});

  @override
  _PokerBettingWidgetState createState() => _PokerBettingWidgetState();
}

class _PokerBettingWidgetState extends State<PokerBettingWidget> {
  final BettingService _bettingService = BettingService();
  int _betAmount = 100;

  void _placeBet() {
    _bettingService.placeBet(widget.roomId, widget.playerId, _betAmount);
  }

  void _raiseBet() {
    _bettingService.raiseBet(widget.roomId, widget.playerId, _betAmount);
  }

  void _callBet() {
    _bettingService.callBet(widget.roomId, widget.playerId, _betAmount);
  }

  void _fold() {
    _bettingService.fold(widget.roomId, widget.playerId);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: _placeBet,
              child: const Text("Bet \$_betAmount"),
            ),
            ElevatedButton(
              onPressed: _raiseBet,
              child: const Text("Raise"),
            ),
            ElevatedButton(
              onPressed: _callBet,
              child: const Text("Call"),
            ),
            ElevatedButton(
              onPressed: _fold,
              child: const Text("Fold"),
            ),
          ],
        ),
        Slider(
          min: 100,
          max: 1000,
          divisions: 9,
          value: _betAmount.toDouble(),
          onChanged: (value) {
            setState(() {
              _betAmount = value.toInt();
            });
          },
          label: "\$_betAmount",
        ),
      ],
    );
  }
}
