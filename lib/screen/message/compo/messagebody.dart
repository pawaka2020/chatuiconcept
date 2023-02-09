import 'package:flutter/cupertino.dart';

import 'chatinputfield.dart';
import 'chatlogs.dart';

class MessageBody extends StatelessWidget {
  const MessageBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Column(children:[
    chatLogs(),  //problem is found here
    const ChatInputField()
  ]);
}
