import 'package:flutter/cupertino.dart';
import '../../../commoncompo/primarybutton.dart';
import '../../../main.dart';
import '../../../uifunctions.dart';
import '../../chat/chatscreen.dart';
//button from the template of PrimaryButton from commoncompo
//navigateTo is supposed to be pointed to ChatScreen but HelloWorld() placeholder for now
PrimaryButton signinButton(BuildContext context) => PrimaryButton(
  context: context,
  pressCallback:()=> navigateTo(context, const ChatScreen()),
  buttonText: "Sign In",
);