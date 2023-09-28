import 'dart:convert';

import 'package:trizi/domain/dtos/user_dto.dart';
import 'package:trizi/domain/models/auth.dart';
import 'package:trizi/utils/headers.dart';
import 'package:trizi/utils/http_router.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  final url = Uri.parse('$apiPath/auth/login');
  
  Future<Auth<UserDto>> generateToken(UserDto userDto) async {
    final login = userDto.login;
    final password = userDto.password;

    if (login == null || password == null) {
      throw Exception("Login ou senha nulos");
    }

    final Map<String, String> data = {
      'login': login,
      'password': password,
    };

    final jsonData = json.encode(data);

    final response = await http.post(
      url,
      headers: jsonHeader,
      body: jsonData,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final jsonData = json.decode(response.body);
      return Auth.fromJson(jsonData);
    } else {
      throw Exception("Não gerou o token");
    }
  }
}
