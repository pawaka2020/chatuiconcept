enum MessageType { text, audio, image, video }
enum MessageStatus { not_sent, not_view, viewed }

class Message{
  final String text;
  final MessageType type;
  final MessageStatus status;
  final bool isSender;

  Message({
    this.text = '',
    required this.type,
    required this.status,
    required this.isSender
  });
}
//we use own repo first
//rightnow this represents the same chat log for all users of the platform.
List MessageList = [
  Message(
    text: "Hi Sajol,",
    type: MessageType.text,
    status: MessageStatus.viewed,
    isSender: false,
  ),
  Message(
    text: "Hello, How are you?",
    type: MessageType.text,
    status: MessageStatus.viewed,
    isSender: true,
  ),
  Message(
    text: "",
    type: MessageType.audio,
    status: MessageStatus.viewed,
    isSender: false,
  ),
  Message(
    text: "",
    type: MessageType.video,
    status: MessageStatus.viewed,
    isSender: true,
  ),
  Message(
    text: "Error happend",
    type: MessageType.text,
    status: MessageStatus.not_sent,
    isSender: true,
  ),
  Message(
    text: "This looks great man!!",
    type: MessageType.text,
    status: MessageStatus.viewed,
    isSender: false,
  ),
  Message(
    text: "Glad you like it",
    type: MessageType.text,
    status: MessageStatus.not_view,
    isSender: true,
  ),
];