
import 'package:chatuiconcept/model_auth/user/chat_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../singletons.dart';
import 'package:chatuiconcept/model_auth/user/chat_user_repo.dart';
//todo: actually show a ui message that sign up has failed and contact customer support.
class ChatUserAuth
{
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
      ChatUser currentUser = ChatUser(
          response.user!.id,
          response.user?.userMetadata!['username'],
          '',
          '',
          DateTime.now(),
          []
      );
      ChatUserRepo().toSupabase(currentUser);
    }
  }

  Future<void> signIn(String email, String password, BuildContext context) async {
      try {
        final response = await supabaseClient.auth.signInWithPassword(
          email: email, password: password,
        );
        if (response.user?.id != null){
          currentUser = ChatUser(
              response.user!.id,
              response.user?.userMetadata!['username'],
              '',
              '',
              DateTime.now(),
              []
          );
          //navigateTo(context, const ChatScreen());
        }
      } on AuthException catch (e) {
        if (e.statusCode != null) {
          // Alert user that their email or password is incorrect
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Wrong email or password. Please try again.'),
            ),
          );
        }
      }
      // catch (e) {
      //   // Handle other exceptions
      // }
    }

  Future<void> signOut() async{
    await supabaseClient.auth.signOut();
    currentUser.reset();
  }

  //unregister();
}