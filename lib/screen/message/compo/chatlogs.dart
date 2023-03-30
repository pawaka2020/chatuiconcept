import 'package:chatuiconcept/commoncompo/smallloadingicon.dart';
import 'package:flutter/cupertino.dart';
import '../../../constants.dart';
import '../../../model/messages.dart';
import 'messagebubble.dart';

/// UI for conversation
Expanded chatLogs() {
  return Expanded(child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: FutureBuilder<List<dynamic>>(
        future: MessageService().getOffline2(), //Here, switch output types whether offline or from a db.
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
            return smallLoadingIcon();
          }
        },
      ),
    ),
  );
}