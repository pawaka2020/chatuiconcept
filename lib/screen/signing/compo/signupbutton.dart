import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../commoncompo/primarybutton.dart';
import '../../../main.dart';
import '../../../uifunctions.dart';
import '../../signup/signupscreen.dart';
//signup button using PrimaryButton template from commoncompo
//navigateTo is supposed to be pointed to Registration() but HelloWorld() placeholder for now
PrimaryButton signupButton(BuildContext context) => PrimaryButton(
    context: context,
    //pressCallback: ()=> navigateTo(context, const HelloWorld()),
    pressCallback: ()=> navigateTo(context, SignUpScreen()),
    buttonText: "Sign Up",
    color: Theme.of(context).colorScheme.secondary
);