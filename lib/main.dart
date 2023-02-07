import 'package:chatuiconcept/screen/welcome.dart';
import 'package:chatuiconcept/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
  debugPrint("run completed");
}
//the widget MyApp is hosting is decoupled for easier testing.
//the default home value in line 21 is WelcomeScreen but feel free to sub
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