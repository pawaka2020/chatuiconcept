import 'package:chatuiconcept/commoncompo/smallloadingicon.dart';
import 'package:flutter/cupertino.dart';

import '../../../constants.dart';
import '../../../model/messages.dart';
import 'messagebubble.dart';
//let's make the model class Messages first.
//a list of message bubbles
// Expanded chatLogs() => Expanded(child: Padding(
//   padding: EdgeInsets.symmetric(horizontal: defaultPadding),
//   child: ListView.builder(
//       itemCount: MessageList.length,
//       itemBuilder: (context, index) =>MessageBubble(message:MessageList[index])
//   ),
// ));
//over here: We swap getOffline with getSupabase.
// Expanded chatLogs(){
//   List<dynamic> messageList = MessageService().getOffline();
//   //List<dynamic> messageList = MessageService().getSupabase();
//   return Expanded(child: Padding(
//     padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
//     child: ListView.builder(
//       itemCount: messageList.length,
//       itemBuilder: (context, index) => MessageBubble(message:messageList[index])
//     )
//   ));
// }

Expanded chatLogs() {
  return Expanded(child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: FutureBuilder<List<dynamic>>(
        future: MessageService().getSupabase(),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasData) {
            List<dynamic> messageList = snapshot.data!;
            return ListView.builder(
              itemCount: messageList.length,
              itemBuilder: (context, index) => MessageBubble(message: messageList[index]),
            );
          } else if (snapshot.hasError) {
            debugPrint("Error: ${snapshot.error}");
            return Text("Error: ${snapshot.error}");
          } else {
            //return Center(child: CircularProgressIndicator());
            return smallLoadingIcon();
          }
        },
      ),
    ),
  );
}