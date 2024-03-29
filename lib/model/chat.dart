
import 'dart:convert';

import 'package:chatuiconcept/model/services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

//Not implemented yet.
//this is a list of the last messages sent to a user
//for now only an offline placeholder will be used
//we need a better class for database (ie another field to denote id of recipent)
class Chat {
  final String name;
  final String lastMessage;
  final String image;
  final String time;
  final bool isActive;
  Chat(this.name, this.lastMessage, this.image, this.time, this.isActive);

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      json['name'] as String,
      json['lastmessage'] as String,
      json['image'] as String,
      json['time'] as String,
      json['isactive'] as bool,
    );
  }
}

class ChatService extends Services  {
  //we use this one for now in our app.
  @override
  List getOffline(){
    return [
      Chat(
        "Jenny Wilson",
        "Hope you are doing well...",
        "assets/images/user.png",
        "3m ago",
        false,
      ),
      Chat(
        "Esther Howard",
        "Hello Abdullah! I am...",
        "assets/images/user_2.png",
        "8m ago",
        true,
      ),
      Chat(
        "Ralph Edwards",
        "Do you have update...",
        "assets/images/user_3.png",
        "5d ago",
        false,
      ),
      Chat(
        "Jacob Jones",
        "You’re welcome :)",
        "assets/images/user_4.png",
        "5d ago",
        true,
      ),
      Chat(
        "Albert Flores",
        "Thanks",
        "assets/images/user_5.png",
        "6d ago",
        false,
      ),
      Chat(
        "Jenny Wilson",
        "Hope you are doing well...",
        "assets/images/user.png",
        "3m ago",
        false,
      ),
      Chat(
        "Esther Howard",
        "Hello Abdullah! I am...",
        "assets/images/user_2.png",
        "8m ago",
        true,
      ),
      Chat(
        "Ralph Edwards",
        "Do you have update...",
        "assets/images/user_3.png",
          "5d ago",
        false,
      ),
    ];
  }

  @override
  Future<List> getSupabase(bool test) async {
    final supabase = Supabase.instance.client;
    final response = await supabase.from('chats').select();
    List<dynamic> jsonArray = jsonDecode(jsonEncode(response));
    List<Chat> result = jsonArray.map((e) =>
        Chat.fromJson(e)).toList();
    return result;
  }
}