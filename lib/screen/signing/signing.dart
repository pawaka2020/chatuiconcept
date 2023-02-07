import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import 'compo/lightdarkimage.dart';
import 'compo/signinbutton.dart';
import 'compo/signupbutton.dart';

class SigningScreen extends StatelessWidget {
  const SigningScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) =>
      Scaffold(body: SafeArea(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(children: [
          const Spacer(flex: 2),
          lightDarkImage(context),
          const Spacer(),
          signinButton(context),
          const SizedBox(height: defaultPadding * 1.5),
          signupButton(context),
          const Spacer(flex: 2)
        ])
      )));
}
