import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../commoncompo/primarybutton.dart';
import '../../../main.dart';
import '../../../uifunctions.dart';
//signup button using PrimaryButton template from commoncompo
//navigateTo is supposed to be pointed to Registration() but HelloWorld() placeholder for now
PrimaryButton signupButton(BuildContext context) => PrimaryButton(
    context: context,
    pressCallback: ()=> navigateTo(context, const HelloWorld()),
    buttonText: "Sign Up",
    color: Theme.of(context).colorScheme.secondary
);