import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../main.dart';
import '../../../uifunctions.dart';

//app bar with button to navigate to
AppBar chatAppBar(BuildContext context) => AppBar(
  automaticallyImplyLeading: false,
  title: const Text("Chats"),
  actions: [
    IconButton(
      icon: const Icon(Icons.search),
      onPressed: ()=> navigateTo(context, const HelloWorld()),
    ),
  ],
);