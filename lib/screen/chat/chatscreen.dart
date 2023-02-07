import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../../uifunctions.dart';
import 'compo/chatappbar.dart';
import 'compo/chatbody.dart';
//chatbody is still unfinished
class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  int _index = 1;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: chatAppBar(context),
    body: ChatBody(),

  );
}



