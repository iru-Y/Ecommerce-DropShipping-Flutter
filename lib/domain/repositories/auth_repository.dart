import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:trizi/domain/models/auth.dart';
import 'package:trizi/utils/http_router.dart';

class AuthRepository {
  final url = Uri.parse('$apiPath/auth/login');


  Future<Auth?> generateToken(String login, String password) async {
    final response = await http.post(
      url,
      body: {'login': login, 'password': password});
      if(response.body.isNotEmpty) {
    final jsonData = await json.decode(response.body);
    return Auth.fromJson(jsonData);
}
  
  }
}

