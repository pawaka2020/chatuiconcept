import 'package:chatuiconcept/screen/message/compo/textmessage.dart';
import 'package:chatuiconcept/screen/message/compo/videomessage.dart';
import 'package:flutter/cupertino.dart';

import '../../../model/messages.dart';
import 'audiomessage.dart';


Widget messageContent(Message message){
  switch (message.type){
    case MessageType.text: return TextMessage(message: message);//problem
    case MessageType.audio: return AudioMessage(message: message);
    case MessageType.video: return VideoMessage(message:message);
    default: return const SizedBox();
  }
}

