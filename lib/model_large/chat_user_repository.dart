import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:supabase/supabase.dart';
import '../singletons.dart';
import '../model_large/user.dart';
import 'package:uuid/uuid.dart';

/// try to make the class just use the singleton supabaseClient, but for now this should be sufficient.
// class ChatUserRepository {
//   final _supabaseClient = supabaseClient;
//
//   Future<void> queueUser(ChatUser user) async {
//     final response = await _supabaseClient
//         .rpc('queue_user', params: user.toMap());
//     if (response != null) {
//       throw Exception(response.error!.message);
//     }
//   }
//
//   Future<void> batchInsertUsers(List<ChatUser> users) async {
//     final batchCount = (users.length / 1000).ceil();
//
//     final batches = <List<ChatUser>>[];
//     for (var i = 0; i < batchCount; i++) {
//       final start = i * 1000;
//       final end = (i + 1) * 1000;
//       batches.add(users.sublist(start, end));
//     }
//
//     for (final batch in batches) {
//       final response = await supabaseClient.rpc('insert_users', params: {
//         'users': batch.map((user) => user.toMap()).toList(),
//       });
//       if (response != null) {
//         throw Exception(response.error!.message);
//       }
//     }
//   }
// }

class ChatUserRepository {
  final List<ChatUser> _userQueue = [];

  Timer? _timer;

  Future<void> queueUser(ChatUser user) async {
    _userQueue.add(user);

    _timer ??= Timer.periodic(const Duration(seconds: 5), (_) {
        _writeUsers();
      });
  }

  Future<void> _writeUsers() async {
    if (_userQueue.isEmpty) {
      _timer?.cancel();
      _timer = null;
      return;
    }

    const batchSize = 1000;
    final batches = <List<ChatUser>>[];
    //final batches = List<List<ChatUser>>;
    while (_userQueue.isNotEmpty) {
      final batch = _userQueue.take(batchSize).toList();
      batches.add(batch);
      _userQueue.removeRange(0, batch.length);
    }

    for (final batch in batches) {
      final response = await supabaseClient.rpc('insert_users', params: {
        'users': batch.map((user) => user.toMap()).toList(),
      });
      if (response.error != null) {
        throw Exception(response.error!.message);
      }
    }
  }

  void testInsertUser() async {
    final chatUserRepository = ChatUserRepository();

    final user = ChatUser(
      uid: '',
      name: 'John Doe',
      email: 'johndoe@example.com',
      signature: '',
      avatarUrl: '',
      dateCreated: DateTime.now(),
      contacts: [],
    );

    await chatUserRepository.queueUser(user);
  }
}

class ChatUserRepositoryLarge {
  final List<ChatUser> _userQueue = [];
  final int batchSize;
  final Duration batchInterval;

  Timer? _timer;

  ChatUserRepositoryLarge({
    this.batchSize = 1000,
    this.batchInterval = const Duration(seconds: 5),
  });

  Future<void> queueUser(ChatUser user) async {
    _userQueue.add(user);

    _timer ??= Timer.periodic(batchInterval, (_) async {
      await _writeUsers();
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
}

void testInsertUser() async {
  final chatUserRepository = ChatUserRepositoryLarge();

  final user = ChatUser(
    uid: const Uuid().v4(),
    //uid:'',
    name: 'Johaabbn Voe',
    email: 'johndoe@example.com',
    signature: '',
    avatarUrl: '',
    dateCreated: DateTime.now(),
    contacts: [],
  );

  await chatUserRepository.queueUser(user);
  debugPrint("end of testinsertuser");
}

