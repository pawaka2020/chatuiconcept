import 'dart:convert';

import 'package:chatuiconcept/model/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChatMessage {
  // id of message, automatically generated by postgres
  final int? id;
  // id of sender, references to id in ChatUser class.
  final int senderId;
  //id of room, references to id in ChatRoom class.
  final int roomId;
  // text of message.
  final String messageText;
  // list of all the emojis included in the message, can be null
  final List<String>? emojiList;
  // list of all the files included in the message, can be null
  final List<String>? fileList;
  // auto-generated by Supabase when a new entry is added to the table.
  final DateTime? timePosted;
  // whether or not message has been deleted, default false.
  final bool deleted;
  // whether or not a message has been read, default true.
  final bool read;


  ChatMessage({
    this.id,
    required this.senderId,
    required this.roomId,
    this.messageText = '',
    this.emojiList,
    this.fileList,
    this.timePosted,
    this.deleted = false,
    this.read = true,
  });

  /// Converts a ChatMessage instance to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'senderId': senderId,
      'messageText': messageText,
      'emojiList': emojiList,
      'fileList': fileList,
      'timePosted': timePosted?.toIso8601String(),
      'deleted': deleted,
      'read': read,
    };
  }

  /// Creates a ChatMessage instance from a JSON map.
  static ChatMessage fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      id: json['id'],
      senderId: json['senderId'],
      roomId: json['roomId'],
      messageText: json['messageText'],
      emojiList: List<String>.from(json['emojiList'] ?? []),
      fileList: List<String>.from(json['fileList'] ?? []),
      timePosted: json['timePosted'] != null
          ? DateTime.parse(json['timePosted'])
          : null,
      deleted: json['deleted'],
      read: json['read'],
    );
  }
}

class ChatMessageService extends Services
{
  @override
  List getOffline() {
    // TODO: implement getOffline
    throw UnimplementedError();
  }

  @override
  Future<List> getSupabase(bool test) async {
    final supabase = Supabase.instance.client;
    final response = await supabase.from('chat_messages').select();
    List<dynamic> jsonArray = jsonDecode(jsonEncode(response));
    List<ChatMessage> result = jsonArray.map((e) =>
        ChatMessage.fromJson(e)).toList();
    if (test == true)
    {
      for (var chatUser in result) {
        debugPrint(chatUser.messageText);
      }
    }
    return result;
  }
// @override
// Future<List<ChatUser>> getSupabase() async {
//   final supabase = Supabase.instance.client;
//   final response = await supabase.from('chat_users').select().execute();
//   final List<dynamic> jsonArray = response.data;
//   final List<ChatUser> result = jsonArray.map((e) {
//     final passwordHash = utf8.decode(
//       pgpSymDecrypt(e['passwordHash'], 'Apple_Sauce'),
//     );
//     return ChatUser.fromJson(e.copyWith(passwordHash: passwordHash));
//   }).toList();
//   return result;
// }
// @override
// Future<List<ChatUser>> getSupabase() async {
//   final supabase = Supabase.instance.client;
//   final response = await supabase.from('chat_users').select();
//   List<dynamic> jsonArray = jsonDecode(jsonEncode(response));
//   List<ChatUser> result = jsonArray.map((e) =>
//       ChatUser.fromJson({
//         'id': e['id'],
//         'name': e['name'],
//         'status': e['status'],
//         'imageData': e['imageData'],
//         'signature': e['signature'],
//         'lastSeen': e['lastSeen'],
//       })).toList();
//   return result;
// }
}