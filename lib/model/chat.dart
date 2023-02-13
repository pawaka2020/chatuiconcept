
import 'package:chatuiconcept/model/services.dart';

class Chat {
  final String name; //TODO: explain
  final String lastMessage; //TODO: explain
  final String image; //TODO: explain
  final String time; //may change this from String to DateTime
  final bool isActive; //TODO: explain
  Chat(this.name, this.lastMessage, this.image, this.time, this.isActive);
}

class ChatService extends Services{
  @override
  List get_offline(){
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
  List get_supabase() {
    return [];
  }
}