
import 'package:chatuiconcept/model_auth/user/chat_user.dart';
import 'package:flutter/cupertino.dart';
import '../../singletons.dart';
import 'package:chatuiconcept/model_auth/user/chat_user_repo.dart';
//todo: actually show a ui message that sign up has failed and contact customer support.
class ChatUserAuth
{
  //Signup
  // Future<void> signUp(String username, String email, String password) async {
  //
  //   final response = await supabaseClient.auth.signUp(
  //     email: email,
  //     //phone: phone,
  //     password: password,
  //     data: {'username': username},
  //   );
  //
  //   var _username = response.user?.userMetadata!['username'];
  //   debugPrint(_username);
  //   debugPrint("signup completed");
  // }

  Future<void> signUp(String username, String email, String password) async {
    final response = await supabaseClient.auth.signUp(
      email: email,
      password: password,
      data: {'username': username},
    );
    var usernameAuth = response.user?.userMetadata!['username'];
    if (usernameAuth != username) {
      debugPrint("Error: signup failed for $username");
    }
    else
    {
      debugPrint("signup completed for $usernameAuth");
      ChatUser user = ChatUser(
          response.user!.id,
          response.user?.userMetadata!['username'],
          '',
          '',
          DateTime.now(),
          []
      );
      ChatUserRepo().toSupabase(user);
    }
  }


  //Signin
  signIn(){}
  //logout
  logOut(){}
  //unregister

}