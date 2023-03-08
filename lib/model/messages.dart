import 'dart:convert';

import 'package:chatuiconcept/model/services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

enum MessageType { text, audio, image, video, $ }
enum MessageStatus { not_sent, not_view, viewed }

class Message{
    final String text;
    final MessageType type;
    final MessageStatus status;
    final bool isSender;
    Message(this.text, this.type, this.status, this.isSender);

    factory Message.fromJson(Map<String, dynamic> json) {
      final typeIndex = MessageType.values.indexWhere((value) => value.toString() == 'MessageType.${json['type']}');
      final type = MessageType.values[typeIndex];
      final statusIndex = MessageStatus.values.indexWhere((value) => value.toString() == 'MessageStatus.${json['status']}');
      final status = MessageStatus.values[statusIndex];

      return Message(
        json['text'] as String,
        type,
        status,
        json['is_sender'] as bool
      );
    }
  }

class MessageService extends Services{
  @override
  List getOffline() {
    return [
      Message(
        "Hi Sajol,",
        MessageType.text,
        MessageStatus.viewed,
        false,
      ),
      Message(
        "Hello, How are you?",
        MessageType.text,
        MessageStatus.viewed,
        true,
      ),
      Message(
        "",
        MessageType.audio,
        MessageStatus.viewed,
        false,
      ),
      Message(
        "",
        MessageType.video,
        MessageStatus.viewed,
        true,
      ),
      Message(
        "Error happened",
        MessageType.text,
        MessageStatus.not_sent,
        true,
      ),
      Message(
        "This looks great man!!",
        MessageType.text,
        MessageStatus.viewed,
        false,
      ),
      Message(
        "Glad you like it",
        MessageType.text,
        MessageStatus.not_view,
        true,
      ),
    ];
  }

  @override
  Future<List> getSupabase(bool test) async {
    final supabase = Supabase.instance.client;
    final response = await supabase.from('message').select();
    List<dynamic> jsonArray = jsonDecode(jsonEncode(response));
    List<Message> result = jsonArray.map((e) =>
        Message.fromJson(e)).toList();
    return result;
  }
}
