import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../model/messages.dart';

class AudioMessage extends StatelessWidget {
  final Message message;
  const AudioMessage({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
    width: MediaQuery.of(context).size.width * 0.55,
    padding: const EdgeInsets.symmetric(
      horizontal: defaultPadding * 0.75,
      vertical: defaultPadding / 2.5,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: primaryColor.withOpacity(message.isSender ? 1 : 0.1),
    ),
    child: audioMessageBody(message)
  );
}

Row audioMessageBody(Message message) {
  Icon playIcon = Icon(
    Icons.play_arrow,
    color: message.isSender ? Colors.white : primaryColor,
  );
  Expanded body = Expanded(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal:defaultPadding / 2),
          child:Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children:[
                Container(
                  width: double.infinity,
                  height: 2,
                  color: message.isSender
                      ? Colors.white
                      : primaryColor.withOpacity(0.4),
                ),
                Positioned(
                  left: 0,
                  child: Container(
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                      color: message.isSender ? Colors.white : primaryColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                )
              ]
          )
      )
  );
  Text durationdisplay = Text(
    "0.37",
    style: TextStyle(
        fontSize: 12, color: message.isSender ? Colors.white : null),
  );
  return Row(children: [
    playIcon,
    body,
    durationdisplay
  ]);
}