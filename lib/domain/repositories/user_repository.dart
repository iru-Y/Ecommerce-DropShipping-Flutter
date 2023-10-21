import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trizi/domain/dtos/user_dto.dart';
import 'package:trizi/domain/exceptions/database_exception.dart';
import 'package:trizi/utils/headers.dart';
import 'package:trizi/utils/http_router.dart';

class UserRepository {
  Future<List<UserDto>> getAll() async {
    final url = Uri.parse('$apiPath/users');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> jsonUsers = json.decode(response.body);
      final List<UserDto> users =
          jsonUsers.map((jsonUser) => UserDto.fromJson(jsonUser)).toList();
      return users;
    }
    throw DatabaseException('Usuário não encontrado para o getAll');
  }

 Future<UserDto> getByMail(String mail, String token) async {
  final url = Uri.parse('$apiPath/users/mail/$mail');

  final response =
      await http.get(url, headers: {'Authorization': 'Bearer $token',
       'Content-Type': 'application/json; charset=utf-8'});
    final users = json.decode(response.body.trim());
     return UserDto.fromJson(users);
}

  Future<void> post(UserDto userDto) async {
    final url = Uri.parse('$apiPath/users');
    final userJson = userDto.toJson();
    await http.post(
      url,
      headers: jsonHeader,
      body: jsonEncode(userJson),
    );
  }
}
