import 'package:andippkd_mpro_b2/meet_lima_belas/Helper/model/model_15.dart';
import 'package:andippkd_mpro_b2/meet_lima_belas/Helper/model/pref.dart';
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
}
