import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../model/messages.dart';
import 'messagecontent.dart';

//we will try to tweak this later
class MessageBubble extends StatelessWidget {
  final Message message;
  const MessageBubble({
    Key? key,
    required this.message,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(top: defaultPadding),
    child:Row(
      //puts message bubble to the right(end) if isSender
      mainAxisAlignment:
        message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
      children:[
        if (!message.isSender)...[
          const CircleAvatar(
              radius:12,
              backgroundImage: AssetImage("assets/images/user_2.png")
          ),
          const SizedBox(width: defaultPadding / 2)
        ],
        messageContent(message), //this is the problem
        //if (message.isSender)MessageStatusDot(status)
      ]
    )
  );
}
