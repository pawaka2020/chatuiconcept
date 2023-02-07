import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
//this is also a template for a button that will be commonly used in the app
//has two versions depending on whether it's filled or not,
//isFilled controls the color, elevation and text color
class FillOutlineButton extends StatelessWidget {
  final bool isFilled;
  final BuildContext context;
  final VoidCallback pressCallback;
  final String buttonText;
  const FillOutlineButton({
    Key? key,
    this.isFilled = true,
    required this.context,
    required this.pressCallback,
    required this.buttonText
  }) : super(key: key);
  @override
  Widget build(BuildContext context) => MaterialButton(
    onPressed: pressCallback,
    shape:RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
      side: const BorderSide(color: Colors.white),
    ),
    elevation: isFilled ? 2 : 0,
    color: isFilled ? Colors.white : Colors.transparent,
    child: Text(
      buttonText,
      style: TextStyle(
        color: isFilled ? contentColorLightTheme : Colors.white,
        fontSize: 12,
      ),
    )
  );
}
