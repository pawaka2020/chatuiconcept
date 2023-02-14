import 'package:flutter/cupertino.dart';

import '../../../constants.dart';
import '../../../model/messages.dart';
import 'messagebubble.dart';
//let's make the model class Messages first.
//a list of message bubbles
// Expanded chatLogs() => Expanded(child: Padding(
//   padding: EdgeInsets.symmetric(horizontal: defaultPadding),
//   child: ListView.builder(
//       itemCount: MessageList.length,
//       itemBuilder: (context, index) =>MessageBubble(message:MessageList[index])
//   ),
// ));

Expanded chatLogs(){
  List messageList = MessageService().getOffline();
  return Expanded(child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
    child:ListView.builder(
      itemCount: messageList.length,
      itemBuilder: (context, index) => MessageBubble(message:messageList[index])
    )
  ));
}