import 'dart:async';
import 'dart:convert';
import 'package:chatuiconcept/model_auth/user/chat_user.dart';
import 'package:flutter/cupertino.dart';

import '../../singletons.dart';

class ChatUserRepo {
  final List<ChatUser> _userQueue = [];
  final int batchSize;
  final Duration batchInterval;
  Timer? _timer;
  String tableName = 'chat_users_auth';

  ChatUserRepo({
    this.batchSize = 1000,
    this.batchInterval = const Duration(seconds: 5),
  });

  Future<void> queueUser(ChatUser user) async {
    _userQueue.add(user);

    _timer ??= Timer.periodic(batchInterval, (_) async {
      await _writeUsers;
    });
  }

  Future<void> _writeUsers() async {
    if (_userQueue.isEmpty) {
      _timer?.cancel();
      _timer = null;
      return;
    }

    final batches = <List<ChatUser>>[];
    while (_userQueue.isNotEmpty) {
      final batch = _userQueue.take(batchSize).toList();
      batches.add(batch);
      _userQueue.removeRange(0, batch.length);
    }

    for (final batch in batches) {
      await supabaseClient.rpc('insert_users_batch', params: {
        'users': batch.map((user) => user.toMap()).toList(),
      });
    }
  }

  Future<void> toSupabase(ChatUser user) async {
    await supabaseClient.from(tableName).insert(user.toMap());
    debugPrint("ChatUser object inserted to $tableName for ${user.username}");
  }

  Future<List> fromSupabase(bool test) async {
    final response = await supabaseClient.from(tableName).select();
    List<dynamic> jsonArray = jsonDecode(jsonEncode(response));
    List<ChatUser> result = jsonArray.map((e) =>
        ChatUser.fromMap(e)).toList();
    if (test == true) {
      for (var chat in result) {
        debugPrint(chat.username);
        debugPrint(chat.signature);
        debugPrint(chat.avatarUrl);
      }
    }
    return result;
  }



}