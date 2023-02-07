import 'package:flutter/cupertino.dart';
//image that changes logo depending on light or dark setting
Image lightDarkImage(BuildContext context) => Image.asset(
    MediaQuery.of(context).platformBrightness == Brightness.light
        ? "assets/images/Logo_light.png"
        : "assets/images/Logo_dark.png",
    height: 146
);