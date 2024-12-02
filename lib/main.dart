import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:poker_project/screens/auth_screen/log_in_screen.dart';
import 'package:poker_project/screens/game_screen/poker_game_screen.dart';


void main() {
  runApp(const PokerGameApp());
}

class PokerGameApp extends StatelessWidget {
  const PokerGameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Poker Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const AuthenticationWrapper(),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            return const PokerGameScreen(roomId: '', playerId: '', tournamentId: '',);
          } else {
            return const LoginScreen();
          }
        } else {
          // Loading state
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
