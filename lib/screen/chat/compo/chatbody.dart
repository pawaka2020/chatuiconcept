import 'package:chatuiconcept/commoncompo/filloutlinebutton.dart';
import 'package:chatuiconcept/screen/chat/compo/chatcard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../commoncompo/smallloadingicon.dart';
import '../../../constants.dart';
import '../../../model/chat.dart';
import '../../../model_auth/user/chat_user_auth.dart';
import '../../../uifunctions.dart';
import '../../message/messagescreen.dart';
import '../../welcome/welcome.dart';

//for now I only call chatlist from this widget but I will improve the architecture
class ChatBody extends StatelessWidget {
  const ChatBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    List<dynamic> chatlist = ChatService().getOffline();
    return Column(children:[
      topBody(context),
      //bottomBody(chatlist, context)
      bottomBody2(context)
    ]);
  }
}

/// The green bar on top.
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

  GestureDetector signOutText = GestureDetector(
    onTap: () {
      ChatUserAuth().signOut();
      //go back to SigningScreen(), but if the user hits back he goes to WelcomeScreen()
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (BuildContext context) => const WelcomeScreen()),
        ModalRoute.withName('/'),
      );
    },
    child: const Text(
      'Sign out',
      style: TextStyle(
        color: Colors.white,
      ),
    ),
  );

  return Container(
    padding: const EdgeInsets.fromLTRB(
        defaultPadding, 0, defaultPadding, defaultPadding),
    color: primaryColor,
    child: Row(children:[
      recentButton,
      const SizedBox(width: defaultPadding),
      activeButton,
      const SizedBox(width: 32.0),
      signOutText,
    ])
  );
}
//we need to implement the Users model first.
//also Chatcard component
//here we navigate to MessageScreen.
// Expanded bottomBody(int length, BuildContext context) => Expanded(child:
//   ListView.builder(
//     itemCount: length,
//     itemBuilder: (context, index) => ChatCard(
//       //chat: chatsData[index],
//       chat:ChatService().get_offline()[index],
//       pressCallback:()=> navigateTo(context, const MessageScreen()))
//   ),
// );

/// The listview containing last messages sent to the user
Expanded bottomBody(List chatlist, BuildContext context) => Expanded(child:
ListView.builder(
    itemCount: chatlist.length,
    itemBuilder: (context, index) => ChatCard(
        chat:chatlist[index],
        pressCallback:()=> navigateTo(context, const MessageScreen()))
),
);

// SizedBox smallLoadingIcon()=> const SizedBox(
//   width: 24,
//   height: 24,
//   child: Center(
//     child: CircularProgressIndicator(),
//   ),
// );

Expanded bottomBody2(BuildContext context) => Expanded(child:
  FutureBuilder<List<dynamic>>(
    future: ChatService().getSupabase(false),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        List chatlist = snapshot.data!;
        return ListView.builder(
            itemCount: chatlist.length,
            itemBuilder: (context, index) => ChatCard(
                chat: chatlist[index],
                pressCallback:()=> navigateTo(context, const MessageScreen()))
        );
      } else if (snapshot.hasError) {
        debugPrint("Error: ${snapshot.error}");
        return Text("Error: ${snapshot.error}");
      } else {
        return smallLoadingIcon();
      }
    },
  ),
);
