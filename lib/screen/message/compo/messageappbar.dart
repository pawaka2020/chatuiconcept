import 'package:flutter/material.dart';

import '../../../constants.dart';


Column nameAndTime = Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: const [
    Text(
      "Kristin Watson",
      style: TextStyle(fontSize: 16),
    ),
    Text(
      "Active 3m ago",
      style: TextStyle(fontSize: 12),
    )
  ],
);
/// displays user image, name, time active, phone and video call buttons
AppBar messageAppBar() =>AppBar(
  automaticallyImplyLeading: false,
  //items arrangd vertically
  title: Row(children: [
    const BackButton(),
    const CircleAvatar(
      backgroundImage:AssetImage("assets/images/user_2.png")
    ),
    const SizedBox(width: defaultPadding * 0.75),
    nameAndTime
  ]),
  actions:[
    IconButton(
      icon: const Icon(Icons.local_phone),
      onPressed: () {},
    ),
    IconButton(
      icon: const Icon(Icons.videocam),
      onPressed: () {},
    ),
    const SizedBox(width: defaultPadding / 2),
  ]
);