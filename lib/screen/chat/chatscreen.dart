import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../../singletons.dart';
import '../../uifunctions.dart';
import 'compo/chatappbar.dart';
import 'compo/chatbody.dart';
import 'compo/chatfab.dart';
//only chatnavbar remains
class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  int _index = 1;

  @override void initState() {
    String username = currentUser.username;
    debugPrint("ChatScreen loaded for user $username");
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: chatAppBar(context),
    body: const ChatBody(),
    floatingActionButton: chatFab(),
    bottomNavigationBar: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _index,
      onTap: (value) {
        setState(() {
          _index = value;
        });
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.messenger), label: "Chats"),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: "People"),
        BottomNavigationBarItem(icon: Icon(Icons.call), label: "Calls"),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            radius: 14,
            backgroundImage: AssetImage("assets/images/user_2.png"),
          ),
          label: "Profile",
        ),
      ],
    ),
  );
}

