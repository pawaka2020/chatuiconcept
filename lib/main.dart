import 'package:chatuiconcept/model/chat.dart';
import 'package:chatuiconcept/screen/welcome/welcome.dart';
import 'package:chatuiconcept/theme.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:chatuiconcept/singletons.dart';

import 'model/chat_user.dart';
import 'model/country.dart';
import 'model_large/chat_user/chat_user_repo.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

//ui works on phones but needs adjusting to work on PC browsers.
void main() async {
  //found in http://localhost:8000 of selfhost Supabase
  //do NOT use localhost, use ip address instead.
  var url = 'http://192.168.1.32:8000';
  //found in docker/.env of selfhost Supabase
  //we keep the same for now. When we move to production we will change the keys.
  var anonkey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE';
  //url2 and anonkey2 are for testing with a cloud Supabase.
  //for now the UI can display backend from my cloud Supabase, not yet from my selfhost Supabase.
  var url2 = 'https://awvkifeyofjyyenvkruh.supabase.co';
  var anonkey2 = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF3dmtpZmV5b2ZqeXllbnZrcnVoIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzU2NTk5ODgsImV4cCI6MTk5MTIzNTk4OH0.ZtmD5XGYvAMH1PyXDeIHJ2c-OUVJVThmWMnFxoXQbSA';

  WidgetsFlutterBinding.ensureInitialized();
  // await Supabase.initialize(
  //   url: url2,
  //   anonKey: anonkey2,
  // );
  //
  supabaseInit = await Supabase.initialize(
    url: url2,
    anonKey: anonkey2,
  );
  /// running the app itself
  runApp(const MyApp());
}

///the Chatroom main class, directing to WelcomeScreen
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Chat App',
    debugShowCheckedModeBanner: false,
    theme: lightThemeData(context),
    darkTheme:darkThemeData(context),
    home:const WelcomeScreen()
  );
}

/// placeholder class for testing only
class HelloWorld extends StatelessWidget {
  const HelloWorld({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(
          child: Text("Hello World!")
        )
  );
}

// import 'package:flutter/material.dart';
// import 'supabase_singleton.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final supabase = SupabaseSingleton().supabaseClient;
//     // Use the supabase instance here
//     ...
//   }
// }
