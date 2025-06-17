import 'dart:convert';

import 'package:andippkd_mpro_b2/API/model/user_model.dart';
// import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<users>> getUsers() async {
  final response = await http.get(
    Uri.parse('https://reqres.in/api/users?page=2'),
  );
  if (response.statusCode == 200) {
    final List<dynamic> userJson = jsonDecode(response.body)['data'];
    return userJson.map((json) => users.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load users');
  }
}
