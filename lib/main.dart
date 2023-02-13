import 'package:chatuiconcept/screen/welcome/welcome.dart';
import 'package:chatuiconcept/theme.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
//ui works on phones but needs adjusting to work on PC browsers.
void main() async {
  var url = 'http://localhost:8000';
  var anonkey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE';
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: url,
    anonKey: anonkey,
  );
  debugPrint("database connected");
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