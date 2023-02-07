import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//handles navigation of a screen to another screen.
navigateTo(BuildContext context, Widget widget){
  Navigator.push(context, MaterialPageRoute(
      builder: (context) => widget));
  debugPrint("screen moved to $widget");
}