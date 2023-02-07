import 'package:chatuiconcept/constants.dart';
import 'package:flutter/material.dart';
//this is a template for a button that will be commonly used in the app
class PrimaryButton extends StatelessWidget {
  final BuildContext context;
  final VoidCallback pressCallback;
  final String buttonText;
  final color;
  final EdgeInsets padding;
  const PrimaryButton({
    Key? key,
    required this.context,
    required this.pressCallback,
    required this.buttonText,
    this.color = primaryColor,
    this.padding = const EdgeInsets.all(defaultPadding * 0.75)
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: pressCallback,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      padding: padding,
      color: color,
      minWidth: double.infinity,
      child: Text(
        buttonText,
        style: const TextStyle(color: Colors.white),
      )
    );
  }
}
