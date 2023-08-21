import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:trizi/domain/models/auth.dart';
import 'package:trizi/utils/http_router.dart';

class AuthRepository {
  // final token = {'Authorization': 'Bearer '};
   final context = {"Content-Type": "Content-Type: media-type;charset=charset-type"};
  final url = Uri.parse('$apiPath/auth/login');

  Future<Auth> generetadToken(String login, String password) async {
    final response = await http.post(
      url,
      headers: context,
      body: {'login': login, 'password': password});
      final jsonData = await json.decode(response.body);
      return Auth.fromJson(jsonData);
  }
}
