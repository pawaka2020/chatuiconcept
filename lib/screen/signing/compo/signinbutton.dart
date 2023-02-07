import 'package:flutter/cupertino.dart';
import '../../../commoncompo/primarybutton.dart';
import '../../../main.dart';
import '../../../uifunctions.dart';
//button from the template of PrimaryButton from commoncompo
PrimaryButton signinButton(BuildContext context) => PrimaryButton(
  context: context,
  pressCallback:()=> navigateTo(context, const HelloWorld()),
  buttonText: "Sign In",
);