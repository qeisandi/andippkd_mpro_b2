import 'dart:convert';

import 'package:andippkd_mpro_b2/meet_dua_belas/model/user_model_12.dart';
import 'package:http/http.dart' as http;

Future<List<Anime>> ambilUsers() async {
  final url = Uri.parse('https://api.jikan.moe/v4/anime');

  try {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final welcome = Welcome.fromJson(jsonResponse);
      return welcome.data ?? [];
    } else {
      throw Exception('Failed to load anime: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error fetching anime data: $e');
  }
}
