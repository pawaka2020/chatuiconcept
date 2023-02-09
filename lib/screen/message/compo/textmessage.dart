import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../model/messages.dart';

//changes color based on platform brightness
//also changes color based on whether it's from sender or receiver
class TextMessage extends StatelessWidget {
  final Message message;
  const TextMessage({
    Key? key,
    required this.message
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
    // color: MediaQuery.of(context).platformBrightness == Brightness.dark
    //     ? Colors.white
    //     : Colors.black,
    padding: const EdgeInsets.symmetric(
      horizontal: defaultPadding * 0.75,
      vertical: defaultPadding / 2,
    ),
    decoration: BoxDecoration(
      color: primaryColor.withOpacity(message.isSender ? 1 : 0.1),
      borderRadius: BorderRadius.circular(30),
    ),
    child: Text(
      message.text,
      style: TextStyle(
        color: message.isSender
            ? Colors.white
            : Theme.of(context).textTheme.bodyText1!.color,
      ),
    ),
  );
}
