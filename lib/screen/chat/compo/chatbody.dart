

import 'package:chatuiconcept/commoncompo/filloutlinebutton.dart';
import 'package:chatuiconcept/screen/chat/compo/chatcard.dart';
import 'package:flutter/cupertino.dart';

import '../../../constants.dart';
import '../../../main.dart';
import '../../../model/Chat.dart';
import '../../../uifunctions.dart';
import '../../message/messagescreen.dart';

class ChatBody extends StatelessWidget {
  const ChatBody({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) => Column(children:[
    topBody(context),
    bottomBody(chatsData.length, context)
  ]);
}

Container topBody(BuildContext context){
  FillOutlineButton activeButton = FillOutlineButton(
      context: context,
      pressCallback: (){},
      buttonText: "Active",
      isFilled: false
  );
  FillOutlineButton recentButton = FillOutlineButton(
      context: context,
      pressCallback: (){},
      buttonText: "Recent Message",
  );
  return Container(
    padding: const EdgeInsets.fromLTRB(
        defaultPadding, 0, defaultPadding, defaultPadding),
    color: primaryColor,
    child: Row(children:[
      recentButton,
      const SizedBox(width: defaultPadding),
      activeButton
    ])
  );
}
//we need to implement the Users model first.
//also Chatcard component
//here we navigate to MessageScreen.
Expanded bottomBody(int length, BuildContext context) => Expanded(child:
  ListView.builder(
    itemCount: length,
    itemBuilder: (context, index) => ChatCard(
      chat: chatsData[index],
      pressCallback:()=> navigateTo(context, const MessageScreen()))
  ),
);