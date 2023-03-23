import 'dart:async';
import 'dart:convert';

import 'package:chatuiconcept/model_large/diagnose/db_diagnose.dart';
import 'package:flutter/cupertino.dart';

import '../../singletons.dart';

class ChatUser {
  /// Uid generated by Supabase. Only value is ''.
  final String uid;
  /// Name of user.
  final String name;
  /// Email address of user.
  final String email;
  /// Signature of user. If not provided default is ''.
  final String signature;
  /// Image of Url, if not provided a default will be used.
  final String avatarUrl;
  /// Date of creation.
  final DateTime dateCreated;
  /// NEW: List of uids as contacts. Starts with null.
  final List<String> contacts;

  /// Constructor.
  ChatUser({
    required this.uid,
    required this.name,
    required this.email ,
    required this.signature,
    required this.avatarUrl,
    required this.dateCreated,
    required this.contacts
  });

  /// Converts a ChatUser2 object to a Map.
  Map<String, dynamic> toMap() {
    return {
      'uid': uid ?? '',
      'name': name,
      'email': email,
      'signature': signature,
      'avatar_url': avatarUrl,
      'date_created': dateCreated.toIso8601String(),
      //'contacts': contacts,
      //'contacts': json.encode(contacts),
      'contacts': contacts,
    };
  }

  static ChatUser fromMap(Map<String, dynamic> map) {
    return ChatUser(
      uid: map['uid'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      signature: map['signature'] as String ?? '',
      avatarUrl: map['avatarUrl'] as String ?? '',
      dateCreated: DateTime.parse(map['dateCreated'] as String),
      contacts: List<String>.from(map['contacts'] ?? []),
      //contacts: json.decode(map['contacts'] as String).cast<String>() ?? [],
    );
  }
}

class ChatUserService {

  /// Writes ChatUser to Supabase.
  Future<void> toSupabase(ChatUser user) async {
    await supabaseClient.from('chat_users_large').insert(user.toMap());
    debugPrint("ChatUser object inserted");
  }

  Future<void> batchInsertUsers(List<ChatUser> users) async {
    final response = await supabaseClient.from('chat_users_large').insert(users);
    if (response.toString().isNotEmpty) {
      throw Exception(response.toString());
    }
  }

  Future<void> queueInsertUser(ChatUser user) async {
    final response = await supabaseClient.from('chat_users_large').insert(user.toMap());
    if (response.toString().isNotEmpty) {
      throw Exception(response.toString());
    }
  }

  /// Retrieves List<ChatUser> from Supabase.
  Future<List> fromSupabase(bool test) async {
    final response = await supabaseClient.from('chat_users_large').select();
    List<dynamic> jsonArray = jsonDecode(jsonEncode(response));
    List<ChatUser> result = jsonArray.map((e) =>
        ChatUser.fromMap(e)).toList();
    if (test == true) {
      for (var chat in result) {
        debugPrint(chat.name);
        debugPrint(chat.signature);
        debugPrint(chat.avatarUrl);
      }
      DbDiagnose().printExecutionTime(() async {
        await Future.delayed(const Duration(seconds: 1)); // Replace this with your database call
      }, 'fromSupabase');
    }
    // final executionTime = printExecutionTime(() async {
    //   await Future.delayed(const Duration(seconds: 1)); // Replace this with your database call
    // }, 'fromSupabase');

    //debugPrint('Execution time: $executionTime ms');
    /// printExecutionTime;

    return result;
  }

  Future<int> printExecutionTime(Function function, String functionName) async {
    final stopwatch = Stopwatch()..start();
    await function();
    final elapsedMs = stopwatch.elapsedMilliseconds;
    debugPrint('Execution time of $functionName: $elapsedMs ms');
    return elapsedMs;
  }
}

class ChatUserWorker {
  /// final supabaseClient = Supabase.instance.client;
  final _jobQueue = StreamController<ChatUser>.broadcast();
  bool _isProcessing = false;

  void queueJob(ChatUser user) {
    _jobQueue.add(user);
    if (!_isProcessing) {
      _startProcessingJobs();
    }
  }

  Future<void> _startProcessingJobs() async {
    _isProcessing = true;
    await for (final job in _jobQueue.stream) {
      try {
        final response =
          await supabaseClient.from('chat_users_large').insert([job]);
        if (response.error != null) {
          throw Exception(response.error!.message);
        }
      } catch (e) {
        // Handle error
      }
    }
    _isProcessing = false;
  }

  void dispose() {
    _jobQueue.close();
  }
}




// CREATE TABLE chat_users_large (
// uid uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
//     name TEXT NOT NULL,
// email TEXT UNIQUE NOT NULL,
// signature TEXT DEFAULT '',
// avatar_url TEXT DEFAULT '',
// date_created TIMESTAMPTZ NOT NULL DEFAULT NOW(),
// contacts TEXT[] DEFAULT '{}'
// );
//
// CREATE INDEX name_idx_cul ON chat_users_large (name);
// CREATE INDEX email_idx_cul ON chat_users_large (email);
// CREATE INDEX created_idx_cul ON chat_users_large (date_created);
// CREATE INDEX contacts_idx_cul ON chat_users_large USING GIN (contacts);
//
// CREATE TABLE staging_chat_users_large (
// id BIGSERIAL PRIMARY KEY NOT NULL,
//     uid TEXT NOT NULL,
// name TEXT NOT NULL,
//     email TEXT UNIQUE NOT NULL,
//     signature TEXT DEFAULT '',
// avatar_url TEXT DEFAULT '',
// created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
// is_processed BOOLEAN NOT NULL DEFAULT false
// );
//
// CREATE INDEX email_idx_scul ON staging_chat_users_large (email);
// CREATE INDEX created_idx_scul ON staging_chat_users_large (created_at);
//SELECT cron.schedule('insert_users', '*/5 * * * *', 'SELECT insert_users(ARRAY[ROW(''uid1'', ''name1'', ''email1'', ''signature1'', ''avatar_url1'', now(), ''{contact1}''), ROW(''uid2'', ''name2'', ''email2'', ''signature2'', ''avatar_url2'', now(), ''{contact2}'')])');

// DROP TABLE IF EXISTS chat_users_large cascade;
// DROP INDEX IF EXISTS name_idx_cul;
// DROP INDEX IF EXISTS email_idx_cul;