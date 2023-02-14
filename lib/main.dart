import 'package:chatuiconcept/model/chat.dart';
import 'package:chatuiconcept/screen/welcome/welcome.dart';
import 'package:chatuiconcept/theme.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'model/country.dart';
//ui works on phones but needs adjusting to work on PC browsers.
void main() async {
  var url = 'http://localhost:8000';
  var anonkey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE';
  var url2 = 'https://awvkifeyofjyyenvkruh.supabase.co';
  var anonkey2 = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF3dmtpZmV5b2ZqeXllbnZrcnVoIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzU2NTk5ODgsImV4cCI6MTk5MTIzNTk4OH0.ZtmD5XGYvAMH1PyXDeIHJ2c-OUVJVThmWMnFxoXQbSA';
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: url2,
    anonKey: anonkey2,
  );
  debugPrint("database connected");
  //List fromSB = await ChatService().getSupabase();
  // List countries = await getCountries();
  // for (var country in countries){
  //   debugPrint(country.name);
  // }
  runApp(const MyApp());
  debugPrint("run completed");
}
//the widget MyApp is hosting is decoupled for easier testing.
//the default home value in line 20 is WelcomeScreen but feel free to sub
//with other widgets for testing UI.
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
//placeholder class
class HelloWorld extends StatelessWidget {
  const HelloWorld({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(
          child: Text("Hello World!")
        )
      );
}