//template for all Service classes
//contains methods to get data from various sources (offline, Supabase for now)
import 'dart:convert';

import 'package:supabase_flutter/supabase_flutter.dart';


abstract class Services {
  List getOffline();
  Future<List> getSupabase(bool test);
}