import 'package:chatuiconcept/model/messages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../commoncompo/primarybutton.dart';
import '../../model_auth/user/chat_user_auth.dart';
import '../../singletons.dart';
import '../../uifunctions.dart';
import '../chat/chatscreen.dart';
import '../verify/verifyscreen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _email = '';
  String _password = '';
  //String _phone = '';
  //String _photo = '';

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      debugPrint('_username: $_username, _email: $_email, _password: $_password');
      await ChatUserAuth().signUp(_username, _email, _password);
      navigateTo(context, const ChatScreen());
    }
  }

  Future<String> getAccessToken() async {
    final session = supabaseClient.auth.currentSession;
    return session?.accessToken ?? '';
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

  Widget _buildPhoneField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      decoration: const InputDecoration(labelText: 'Phone'),
      validator: (value) {
        if (value == null) {
          return 'Please enter a valid phone number';
        }
        return null;
      },
      onSaved: (value) {
        //_phone = value!.trim();
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

  Widget _buildUsernameField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'User name'),
      validator: (value) {
        if (value == null) {
          return 'Please enter a valid name';
        }
        return null;
      },
      onSaved: (value) {
        _username = value!.trim();
      },
    );
  }

  Widget _signUpButton(BuildContext context) => PrimaryButton(
    context: context,
    pressCallback:()=> _submitForm(),
    buttonText: "Sign Up",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _buildUsernameField(), //TextFormField
                _buildEmailField(), //TextFormField
                //_buildPhoneField(), //TextFormField
                _buildPasswordField(), //TextFormField
                //_buildPhotoField()
                const SizedBox(height: 16.0),
                _signUpButton(context)
              ],
            ),
          ),
        ),
      )
    );
  }
}
