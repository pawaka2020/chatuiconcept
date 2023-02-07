import 'package:chatuiconcept/constants.dart';
import 'package:chatuiconcept/main.dart';
import 'package:chatuiconcept/uifunctions.dart';
import 'package:flutter/material.dart';

import '../signing/signing.dart';
//import 'package:chat/screens/signinOrSignUp/signin_or_signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  //background image
  Image backgroundImage() => Image.asset(
      "assets/images/welcome_image.png"
  );
  //The bolded text beneath the image
  Text topText(BuildContext context) => Text(
    "Welcome to our freedom \nmessaging app",
    textAlign: TextAlign.center,
    style: Theme.of(context)
        .textTheme
        .headline5!
        .copyWith(fontWeight: FontWeight.bold),
  );
  //unbolded text beneath the first bolded text
  Text middleText(BuildContext context) => Text(
    "The freedom to talk to any person of your \nmother language.",
    textAlign: TextAlign.center,
    style: TextStyle(
      color: Theme.of(context)
          .textTheme
          .bodyText1!
          .color!
          .withOpacity(0.64),
    ),
  );
  //area containing button
  //we navigate to HelloWorld for now, but the real intended target for navigation
  //is SigningScreen
  FittedBox buttonArea(BuildContext context) {
    Text skipText = Text(
      "Skip",
      style: Theme.of(context).textTheme.bodyText1!.copyWith(
        color: Theme.of(context)
            .textTheme
            .bodyText1!
            .color!
            .withOpacity(0.8),
      ),
    );
    Icon buttonIcon = Icon(
      Icons.arrow_forward_ios,
      size: 16,
      color: Theme.of(context)
          .textTheme
          .bodyText1!
          .color!
          .withOpacity(0.8),
    );
    Row buttonUi = Row(children: [
      skipText,
      const SizedBox(width:defaultPadding / 4),
      buttonIcon
    ]);
    TextButton button = TextButton(
        onPressed:()=> navigateTo(context, const SigningScreen()),
        child: buttonUi
    );
    return FittedBox(child: button);
  }
  @override
  Widget build(BuildContext context) =>
      Scaffold(body: SafeArea(child: Column(children: [
          const Spacer(flex:2),
          backgroundImage(),
          const Spacer(flex:3),
          topText(context),
          const Spacer(),
          middleText(context),
          const Spacer(flex:3),
          buttonArea(context)
      ])));
}
