import 'package:chatuiconcept/screen/welcome/welcome.dart';
import 'package:chatuiconcept/theme.dart';
import 'package:flutter/material.dart';
//ui works on phones but needs adjusting to work on PC browsers.
void main() {
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