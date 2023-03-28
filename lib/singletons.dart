import 'dart:async';

import 'package:supabase_flutter/supabase_flutter.dart';

import 'model_auth/user/chat_user.dart';

/// We only have a single SupabaseClient to improve app performance and reduce
/// resource usage.
final supabaseClient = Supabase.instance.client;
late Supabase supabaseInit;
StreamSubscription<AuthChangeEvent>? _authSubscription;
StreamSubscription<AuthChangeEvent>? abc;

late ChatUser currentUser;