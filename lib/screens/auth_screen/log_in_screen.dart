import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:poker_project/screens/auth_screen/firebase_auth_service.dart';
import 'package:poker_project/screens/game_screen/home_screen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuthService _authService = FirebaseAuthService();

  void _login() async {
    User? user = await _authService.loginWithEmailPassword(
      _emailController.text,
      _passwordController.text,
    );

    if (user != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen(playerId: '',)),
      );
    } else {
      // Show error message
      print("Login failed");
    }
  }

  void _loginWithGoogle() async {
    User? user = await _authService.loginWithGoogle();
    if (user != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen(playerId: '',)),
      );
    }
  }

  void _loginWithFacebook() async {
    User? user = await _authService.loginWithFacebook();
    if (user != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen(playerId: '',)),
      );
    }
  }

  void _resetPassword() {
    if (_emailController.text.isNotEmpty) {
      _authService.resetPassword(_emailController.text);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Password reset email sent!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: "Password"),
            ),
            ElevatedButton(
              onPressed: _login,
              child: const Text("Login"),
            ),
            ElevatedButton(
              onPressed: _loginWithGoogle,
              child: const Text("Login with Google"),
            ),
            ElevatedButton(
              onPressed: _loginWithFacebook,
              child: const Text("Login with Facebook"),
            ),
            TextButton(
              onPressed: _resetPassword,
              child: const Text("Forgot Password?"),
            ),
          ],
        ),
      ),
    );
  }
}
