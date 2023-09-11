import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:trizi/domain/exceptions/user_exception.dart';
import 'package:trizi/domain/models/user.dart';
import 'package:trizi/utils/http_router.dart';

class UserRepository {
  Future<List<User>> getAll() async {
    final url = Uri.parse('$apiPath/users');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> jsonUsers = json.decode(response.body);
      final List<User> users =
          jsonUsers.map((jsonUser) => User.fromJson(jsonUser)).toList();
      return users;
    }
    throw UserException(
        "Não foi possível abrir a consulta de usuários no banco de dados, usuário nulo");
  }

  Future<User?> getByLogin() async {
    final url = Uri.parse('$apiPath/users/login/yuri');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final users = await json.decode(response.body);
      return User.fromJson(users);
    }
    return null;
  }
}
