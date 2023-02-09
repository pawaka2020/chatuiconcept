import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'compo/messageappbar.dart';
import 'compo/messagebody.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: messageAppBar(),
    body: const MessageBody(),
  );
}

