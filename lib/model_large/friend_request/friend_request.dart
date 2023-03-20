//frequest
//}{idsender, idmyself, date sent, status(pending, accept, reject)
//cron job in db: auto-remove from table after 10 days
//when accept or reject, execute updateContact in User. (client side)

class FriendRequest {
  /// Unique identifier for the friend request.
  final String uid;
  /// ChatUser.uid denoting sender of friend request.
  final String senderUid;
  /// ChatUser.uid denoting recipient of friend request.
  final String recipientUid;
  /// Date friend request is sent.
  final DateTime dateCreated;
  /// Status in string form, whether "pending" (default), "accepted" or "rejected".
  final String status;

  FriendRequest({
    required this.uid,
    required this.senderUid,
    required this.recipientUid,
    required this.dateCreated,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid ?? '',
      'sender_uid': senderUid,
      'recipient_uid': recipientUid,
      'date_created': dateCreated.toIso8601String(),
      'status': status,
    };
  }

  static FriendRequest fromMap(Map<String, dynamic> map) {
    return FriendRequest(
      uid: map['uid'] as String,
      senderUid: map['sender_uid'] as String,
      recipientUid: map['recipient_uid'] as String,
      dateCreated: DateTime.parse(map['date_created'] as String),
      status: map['status'] as String,
    );
  }
}


