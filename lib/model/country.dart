import 'dart:convert';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
//this is not used in the chatroom app but only added for testing connection to database
class Country
{
  final String name;
  Country(this.name);

  factory Country.fromJson(Map<String, dynamic> map)
  => Country(map['name']);
}

Future<List<Country>> getCountries() async {
  final supabase = Supabase.instance.client;
  var response = await supabase.from('countries').select();
  List<dynamic> jsonArray = jsonDecode(jsonEncode(response));
  List<Country> countries = jsonArray.map((e) =>
      Country.fromJson(e)).toList();
  for (var country in countries)
  {
    debugPrint(country.name);
  }
  return countries;
}