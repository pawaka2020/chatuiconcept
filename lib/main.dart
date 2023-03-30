import 'package:chatuiconcept/model/chat.dart';
import 'package:chatuiconcept/screen/welcome/welcome.dart';
import 'package:chatuiconcept/theme.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:chatuiconcept/singletons.dart';

import 'model/country.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

//ui works on phones but needs adjusting to work on PC browsers.
void main() async {
  //found in http://localhost:8000 of selfhost Supabase
  //find your IP address then change the value.
  //supabase self host has a bit of problems with sending confirmation emails.
  var url = 'http://192.168.1.32:8000';
  var anonkey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE';
  //url2 and anonkey2 are for testing with a cloud Supabase.
  var url2 = 'https://awvkifeyofjyyenvkruh.supabase.co';
  var anonkey2 = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF3dmtpZmV5b2ZqeXllbnZrcnVoIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzU2NTk5ODgsImV4cCI6MTk5MTIzNTk4OH0.ZtmD5XGYvAMH1PyXDeIHJ2c-OUVJVThmWMnFxoXQbSA';
  //Dappnology server self host
  var url3 = 'http://18.142.231.244:8000';
  var anonkey3 = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8B';
  //try this in case anonkey3 doesn't work.
  var serviceRoleKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJzZXJ2aWNlX3JvbGUiLAogICAgImlzcyI6ICJzdXBhYmFzZS1kZW1vIiwKICAgICJpYXQiOiAxNjQxNzY5MjAwLAogICAgImV4cCI6IDE3OTk1MzU2MDAKfQ.DaYlNEoUrrEn2Ig7tqib';
  WidgetsFlutterBinding.ensureInitialized();
  supabaseInit = await Supabase.initialize(
    url: url3,
    anonKey: anonkey3,
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