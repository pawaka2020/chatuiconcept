import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../commoncompo/primarybutton.dart';
import '../../model_auth/user/chat_user.dart';
import '../../model_auth/user/chat_user_auth.dart';
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

  Future<void> _signIn() async {
    if (_formKey.currentState!.validate()){
      _formKey.currentState!.save();
      await ChatUserAuth().signIn(_email, _password, context);
    }
  }

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

  Widget _buildSignInButton() => PrimaryButton(
    context: context,
    pressCallback:()=> _signIn(),
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  _buildEmailField(), //TextFormField
                  _buildPasswordField(), //TextFormField
                  const SizedBox(height: 32.0),
                  _buildSignInButton(),
                  const SizedBox(height: 16.0),
                  _buildForgotPasswordText()
                ],
              ),
            ),
          ),
        )
    );
  }
}


