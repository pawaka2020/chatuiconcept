import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../model/Chat.dart';

//a Card UI that holds conversations
//links to the Chat model class in model/chatscreen.dart
//returns an Inkwell = a rectangular View that responses to touch
class ChatCard extends StatelessWidget {
  final Chat chat;
  final VoidCallback pressCallback;
  const ChatCard({
    Key? key,
    required this.chat,
    required this.pressCallback
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: pressCallback,
      child: Padding(
          padding:
              EdgeInsets.symmetric(
                horizontal: defaultPadding,
                vertical: defaultPadding * 0.75
          ),
          child: Row(children:[
            userAvatar(chat.image, chat.isActive, context),
            messageDisplay(chat.name, chat.lastMessage),
            timeDisplay(chat.time)
        ])
      ),
    );
  }
}

BoxDecoration decor(BuildContext context) => BoxDecoration(
  color: primaryColor,
  shape: BoxShape.circle,
  border:Border.all(
    color:Theme.of(context).scaffoldBackgroundColor,
    width: 3
  )
);

//shows the user avatar in a circle shape
//also shows a decoration if a user is active
Stack userAvatar(String image, bool isActive, BuildContext context) => Stack(children:[
  CircleAvatar(
    radius: 24,
    backgroundImage: AssetImage(image)
  ),
  if (isActive)
    Positioned(child: Container(
      height: 16,
      width: 16,
      decoration: decor(context)
    ),)
]);

//displays last message from a user
Expanded messageDisplay(String name, String lastMessage) => Expanded(child:
  Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Text(
            name,
            style:
            const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          Opacity(
            opacity: 0.64,
            child: Text(
              lastMessage,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ]
      ),
  ),

);

//displays the time
Opacity timeDisplay(String time) => Opacity(
  opacity: 0.64,
  child: Text(time)
);
