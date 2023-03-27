import 'dart:async';
import '../../singletons.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class VerifyScreen extends StatefulWidget {
  VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  bool _isEmailVerified = false;
  //StreamSubscription<AuthChangeEvent>? _authStateChangeSubscription;
  StreamSubscription<AuthState>? _authStateChangeSubscription;

  void _listenToAuthStateChange(){
    final auth = supabaseClient.auth;
    auth.onAuthStateChange.listen((event) {
      if(auth.currentUser?.emailConfirmedAt != null){
        String name = auth.currentUser?.userMetadata!["username"];
        debugPrint("email for $name verified");
        _isEmailVerified = true;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _listenToAuthStateChange();
  }
  void _onButtonPressed(){}

  Widget _buildVerifyButton() {
    return ElevatedButton(
      onPressed: _isEmailVerified ? _onButtonPressed : null,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            if (!_isEmailVerified) {
              return Colors.grey; // Use a different color for disabled state
            }
            return Colors.blue; // Use blue color for normal state
          },
        ),
        foregroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            if (!_isEmailVerified) {
              return Colors.white; // Use white color for text in disabled state
            }
            return Colors.black; // Use black color for text in normal state
          },
        ),
      ),
      child: const Text('My Button'),
    );
  }

  Widget _buildVerifyText(String username) {
    String username2 = "Johnny";
    return const Text(
      'Thank you for registering. Please check your email for verification.',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 18),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildVerifyText(""),
            const SizedBox(height: 20),
            _buildVerifyButton(),
          ],
        ),
      ),
    );
  }
}

