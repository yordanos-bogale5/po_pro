import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:poker_project/betting_timer/betting_timer.dart';
import 'package:poker_project/services/betting_service.dart';
import 'package:poker_project/services/tournament_service.dart';
import 'package:poker_project/widgets/poker_betting_widget.dart';

class PokerGameScreen extends StatefulWidget {
  final String roomId;
  final String playerId;
  final String tournamentId;

  const PokerGameScreen({
    super.key,
    required this.roomId,
    required this.playerId,
    required this.tournamentId,
  });

  @override
  _PokerGameScreenState createState() => _PokerGameScreenState();
}

class _PokerGameScreenState extends State<PokerGameScreen> {
  final BettingService _bettingService = BettingService();
  final BettingTimer _bettingTimer =
      BettingTimer(duration: 2000); // Set 2000 seconds for each betting round
  final TournamentService _tournamentService = TournamentService();

  bool _isTimerRunning = false;
  int _remainingTime = 30;
  String _tournamentStatus = "Ongoing";
  String _winner = "";

  @override
  void initState() {
    super.initState();
    _bettingTimer.remainingTime.listen((timeLeft) {
      setState(() {
        if (timeLeft >= 0) {
          _remainingTime = timeLeft;
        } else {
          // Time's up, move to next phase or notify players
          _onTimeUp();
        }
      });
    });
    _checkTournamentStatus();
  }

  // Check the status of the tournament from Firestore
  void _checkTournamentStatus() async {
    DocumentSnapshot tournamentSnapshot = await FirebaseFirestore.instance
        .collection('tournaments')
        .doc(widget.tournamentId)
        .get();

    if (tournamentSnapshot.exists) {
      setState(() {
        Map<String, dynamic>? data =
            tournamentSnapshot.data() as Map<String, dynamic>?;
        _tournamentStatus = data?['status'] ?? 'Ongoing';
        _winner = data?['winner'] ?? '';
      });
    }
  }

  void _onTimeUp() {
    _bettingService.fold(widget.roomId, widget.playerId);
  }

  void _startBettingRound() {
    setState(() {
      _isTimerRunning = true;
    });
    _bettingTimer.start();
  }

  void _eliminatePlayer() async {
    await _tournamentService.eliminatePlayer(widget.tournamentId, widget.playerId);
    _checkTournamentStatus();
  }

  void _endTournament() async {
    await _tournamentService.declareWinner(widget.tournamentId, widget.playerId);
    _checkTournamentStatus();
  }

  @override
  void dispose() {
    _bettingTimer.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Poker Game"),
      ),
      body: Column(
        children: [
          const Text("Your Hand:"),
          const Text("Player Hand Goes Here"),
          PokerBettingWidget(roomId: widget.roomId, playerId: widget.playerId),
          const SizedBox(height: 20),
          _isTimerRunning
              ? Text("Time Remaining: $_remainingTime seconds")
              : ElevatedButton(
                  onPressed: _startBettingRound,
                  child: const Text("Start Betting Round"),
                ),
          StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('rooms')
                .doc(widget.roomId)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Map<String, dynamic>? roomData =
                    snapshot.data?.data() as Map<String, dynamic>?;
                int remainingTime = roomData?['bettingRoundRemainingTime'] ?? 30;
                return Column(
                  children: [
                    Text("Time Remaining: $remainingTime seconds"),
                  ],
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
          StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('tournaments')
                .doc(widget.tournamentId)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Map<String, dynamic>? data =
                    snapshot.data?.data() as Map<String, dynamic>?;
                String type = data?['type'] ?? 'Classic';
                int currentRound = data?['currentRound'] ?? 1;
                int pot = data?['pot'] ?? 0;
                return Column(
                  children: [
                    Text("Tournament Type: $type"),
                    Text("Current Round: $currentRound"),
                    Text("Current Pot: \$${pot.toString()}"),
                  ],
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
          ElevatedButton(
            onPressed: _eliminatePlayer,
            child: const Text("Eliminate Player"),
          ),
          ElevatedButton(
            onPressed: _endTournament,
            child: const Text("End Tournament"),
          ),
        ],
      ),
    );
  }
}
