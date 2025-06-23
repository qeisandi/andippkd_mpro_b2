import 'dart:convert';

import 'package:andippkd_mpro_b2/meet_lima_belas/Helper/model/edit_model.dart';
import 'package:andippkd_mpro_b2/meet_lima_belas/Helper/model/model_15.dart';
import 'package:andippkd_mpro_b2/meet_lima_belas/Helper/model/model_profile.dart';
import 'package:andippkd_mpro_b2/meet_lima_belas/Helper/model/pref.dart';
import 'package:andippkd_mpro_b2/meet_lima_belas/Helper/shared/shred.dart';
import 'package:andippkd_mpro_b2/meet_lima_belas/endpoint.dart';
import 'package:http/http.dart' as http;

class UserServis {
  Future<Map<String, dynamic>> regisUser({
    required String email,
    required String name,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse(Endpoint.register),
      headers: {"Accept": "application/json"},
      body: {"name": name, "email": email, "password": password},
    );
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(registerResponseFromJson(response.body).toJson());
      return registerResponseFromJson(response.body).toJson();
    } else if (response.statusCode == 422) {
      return registerErrorResponseFromJson(response.body).toJson();
    } else {
      print("Maaf Tidak Bisa Register User: ${response.statusCode}");
      throw Exception("Gagal Untuk register User: ${response.statusCode}");
    }
  }

  Future<Map<String, dynamic>> loginUser({
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse(Endpoint.login),
      headers: {"Accept": "application/json"},
      body: {"email": email, "password": password},
    );
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(registerResponseFromJson(response.body).toJson());
      return registerResponseFromJson(response.body).toJson();
    } else if (response.statusCode == 422) {
      return registerErrorResponseFromJson(response.body).toJson();
    } else {
      print("Maaf Tidak Bisa Register User: ${response.statusCode}");
      throw Exception("Gagal Untuk register User: ${response.statusCode}");
    }
  }

  Future<Profile> profileUser() async {
    final token = await SharedPref.getToken();

    if (token == null) {
      throw Exception('Token tidak di temukan. Login terlebih dahulu');
    }

    final response = await http.get(
      Uri.parse('https://absen.quidi.id/api/profile'),
      headers: {'Accept': 'application/json', 'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final getprofile = GetProfile.fromJson(jsonResponse);
      return getprofile.data!;
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<Edit> updateProfile({required String name}) async {
    final token = await SharedPref.getToken();

    final response = await http.put(
      Uri.parse('https://absen.quidi.id/api/profile'),
      headers: {'Accept': 'application/json', 'Authorization': 'Bearer $token'},
      body: {'name': name},
    );

    if (response.statusCode == 200) {
      return EditProfile.fromJson(jsonDecode(response.body)).data!;
    } else {
      throw Exception("Gagal update: ${response.statusCode}");
    }
  }
}
