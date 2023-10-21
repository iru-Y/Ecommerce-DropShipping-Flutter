import 'dart:convert';

import 'package:trizi/domain/dtos/user_dto.dart';
import 'package:trizi/domain/models/auth.dart';
import 'package:trizi/domain/services/auth_service.dart';
import 'package:trizi/utils/headers.dart';
import 'package:trizi/utils/http_router.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  final url = Uri.parse('$apiPath/auth/mail');
  final AuthService authService = AuthService();
  Future<Auth<UserDto>> generateToken(String? mail, String? password) async {
    var us =
        UserDto(mail: mail, password: password);

    final jsonData = json.encode(us);

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
