import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../model/messages.dart';

class VideoMessage extends StatelessWidget {
  final Message message;
  VideoMessage({
    Key? key,
    required this.message
  }) : super(key: key);
  ClipRRect video = ClipRRect(
    borderRadius: BorderRadius.circular(8),
    child: Image.asset("assets/images/Video Place Here.png"),
  );
  Container playicon = Container(
    height: 25,
    width: 25,
    decoration: const BoxDecoration(
      color: primaryColor,
      shape: BoxShape.circle,
    ),
    child: const Icon(
      Icons.play_arrow,
      size: 16,
      color: Colors.white,
    ),
  );
  @override
  Widget build(BuildContext context) => SizedBox(
      width: MediaQuery.of(context).size.width * 0.45,
      child: AspectRatio(
        aspectRatio: 1.6,
        child: Stack(
          alignment: Alignment.center,
          children:[
            video,
            playicon
          ]
        )
      )
  );
}