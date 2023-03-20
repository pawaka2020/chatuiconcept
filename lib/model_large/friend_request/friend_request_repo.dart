import 'package:uuid/uuid.dart';

import 'friend_request.dart';

class FriendRequestRepo{
  FriendRequest createFriendRequest(String senderUid, String recipientUid) {
    final uid = const Uuid().v4();
    final dateCreated = DateTime.now();
    const status = 'pending';

    return FriendRequest(
      uid: uid,
      senderUid: senderUid,
      recipientUid: recipientUid,
      dateCreated: dateCreated,
      status: status,
    );
  }

  /// toSupabase

/// toSupabaseBatch
}