import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trizi/domain/dtos/user_dto.dart';
import 'package:trizi/domain/services/auth_service.dart';
import 'package:trizi/utils/headers.dart';
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

 Future<UserDto?> getByMail(String mail) async {
  final token = AuthService().token;
  final url = Uri.parse('$apiPath/users/mail/$mail');

  var response =
      await http.get(url, headers: {'Authorization': 'Bearer $token'});
  if (response.statusCode == 200) {
    var users = json.decode(response.body);
    return UserDto.fromJson(users);
  }
  return null;
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
