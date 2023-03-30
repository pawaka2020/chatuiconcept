/// An always-on listener function that listens to any email verification
/// from registered users processed by Supabase Auth

import 'dart:async';

import 'package:chatuiconcept/model_auth/user/chat_user.dart';
import 'package:chatuiconcept/model_auth/user/chat_user_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../singletons.dart';

///doesn't work.
void emailVerifyListener() {
  StreamSubscription<AuthState> abc2 = supabaseClient.auth.onAuthStateChange.listen((event) {
    if (event.event == AuthChangeEvent.signedIn){
      if (supabaseClient.auth.currentUser!.emailConfirmedAt == null)
      {
        //user does not confirm email. Maybe show a UI screen about user not verifying and then
        //nicely ask the user to try to register again.
      }
      else
      {
        ChatUser user = ChatUser(
            supabaseClient.auth.currentUser!.id,
            supabaseClient.auth.currentUser?.userMetadata!['username'],
            '',
            '',
            DateTime.now(),
            []
        );
        ChatUserRepo().toSupabase(user);
      }
    }
  });
}