import 'dart:convert';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
  return countries;
}