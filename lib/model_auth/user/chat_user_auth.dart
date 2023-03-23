

import 'package:flutter/cupertino.dart';

import '../../singletons.dart';
//todo: actually show a ui message that sign up has failed and contact customer support.
class ChatUserAuth
{
  //Signup
  Future<void> signUp(String username, String phone, String email, String password) async {
    final response = await supabaseClient.auth.signUp(
      email: email,
      phone: phone,
      password: password,
      data: {'username': username},
    );

    var _username = response.user?.userMetadata!['username'];

    // if (response.user?.email != email ||
    //     response.user?.userMetadata!['username'] != username) {
    //   debugPrint('Error: Supabase Auth response does not match input data.');
    // }
    debugPrint(_username);
    debugPrint("signup completed");
  }
  //Signin
  signIn(){}
  //logout
  logOut(){}
  //unregister

}