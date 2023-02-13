import 'package:chatuiconcept/model/services.dart';

enum MessageType { text, audio, image, video }
enum MessageStatus { not_sent, not_view, viewed }

class Message{
  final String text;
  final MessageType type;
  final MessageStatus status;
  final bool isSender;
  Message(this.text, this.type, this.status, this.isSender);
}

class MessageService extends Services{
  @override
  List get_offline() {
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
  List get_supabase() {
    // TODO: implement get_supabase
    throw UnimplementedError();
  }
}
