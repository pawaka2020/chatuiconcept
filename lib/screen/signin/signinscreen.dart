import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../commoncompo/primarybutton.dart';
import '../../model_auth/user/chat_user.dart';
import '../../singletons.dart';
import '../../uifunctions.dart';
import '../chat/chatscreen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  Widget _buildEmailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(labelText: 'Email'),
      validator: (value) {
        if (value == null || !value.contains('@')) {
          return 'Please enter a valid email address';
        }
        return null;
      },
      onSaved: (value) {
        _email = value!.trim();
      },
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(labelText: 'Password'),
      validator: (value) {
        if (value == null || value.length < 6) {
          return 'Password must be at least 6 characters long';
        }
        return null;
      },
      onSaved: (value) {
        _password = value!.trim();
      },
    );
  }

  Future<void> signIn(String email, String password) async {

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      debugPrint('_email: $_email, _password: $_password');
      final response = await supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (response.user?.id != null)
      {
        currentUser = ChatUser(
            response.user!.id,
            response.user?.userMetadata!['username'],
            '',
            '',
            DateTime.now(),
            []
        );
        navigateTo(context, const ChatScreen());
      }
    }

  }
  Widget _buildSignInButton(BuildContext context) => PrimaryButton(
    context: context,
    pressCallback:()=> signIn(_email, _password),
    buttonText: "Sign In",
  );

  Widget _buildForgotPasswordText() {
    return GestureDetector(
      onTap: () {
        // TODO: Handle forgot password logic
      },
      child: const Text('Forgot password?'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildEmailField(),
              const SizedBox(height: 16.0),
              _buildPasswordField(),
              const SizedBox(height: 16.0),
              _buildSignInButton(context),
              const SizedBox(height: 16.0),
              _buildForgotPasswordText(),
            ],
          ),
        ),
      ),
    );
  }
}
