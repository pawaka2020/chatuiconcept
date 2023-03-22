import 'package:chatuiconcept/model/messages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../commoncompo/primarybutton.dart';
import '../../singletons.dart';
import '../../uifunctions.dart';
import '../chat/chatscreen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _email = '';
  String _password ='';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // TODO: Implement Supabase Auth sign up here
      //SupabaseAuthSignup()
    }
  }

  Future<void> _supabaseAuthSignUp(String email, String password) async{
    final response = await supabaseClient.auth.signUp(password: password, email:email);
    //await supabaseClient.auth.
    final user = response.user;

    //supabaseClient.auth.signUp

    //supabaseClient.
  }

  Future<Message> authGetMessage(String token) async {
    Message message;
    final url = Uri.parse('https://<your-supabase-url>/rest/v1/messages');
    final headers = {'Authorization': 'Bearer $token'};
    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      message = json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
    return message;
  }

  Widget _buildEmailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(labelText: 'Email'),
      validator: (value) {
        if (value!.isEmpty || !value.contains('@')) {
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
        if (value!.isEmpty || value.length < 6) {
          return 'Password must be at least 6 characters long';
        }
        return null;
      },
      onSaved: (value) {
        _password = value!.trim();
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildEmailField(),
              _buildPasswordField(),
              const SizedBox(height: 16.0),
              _signUpButton(context)
            ],
          ),
        ),
      ),
    );
  }
}





