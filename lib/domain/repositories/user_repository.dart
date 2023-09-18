import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:trizi/domain/dtos/user_dto.dart';
import 'package:trizi/utils/http_router.dart';

class UserRepository {
  Future<List<UserDto>?> getAll() async {
    final url = Uri.parse('$apiPath/users');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> jsonUsers = json.decode(response.body);
      final List<UserDto> users =
          jsonUsers.map((jsonUser) => UserDto.fromJson(jsonUser)).toList();
      return users;
    }
    return null;
  }

  Future<UserDto?> getByLogin(String login) async {
    final url = Uri.parse('$apiPath/users/login$login');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final users = await json.decode(response.body);
      return UserDto.fromJson(users);
    }
    return null;
  }

  Future<void> createUser(UserDto userDto) async {
    final url = Uri.parse('$apiPath/users/nodata');
    final userJson = userDto.toJson();
    await http.post(
      url,
      body: jsonEncode(userJson),
      headers: {'Content-Type': 'application/json'},
    );
  }
}
