//template for all Service classes
//contains methods to get data from various sources (offline, Supabase for now)
abstract class Services {
  List getOffline();
  Future<List> getSupabase();
}