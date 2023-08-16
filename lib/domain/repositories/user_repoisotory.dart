import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../utils/http_router.dart';
import '../models/user.dart';

class UserRepository {
  Future<List<User>> getAll() async {
    final List<User> user = [];

    final url = await http.get(Uri.parse('$apiPath/user'));

    Iterable json = jsonDecode(url.body);

    json.map((e) {
      final User users = User.fromJson(e);
      user.add(users);
    }).toList();

    return user;
  }

  Future<User> getLogin(String login) async {
    final url = await http.get(Uri.parse('$apiPath/login/$login'));
    final json = jsonDecode(url.body);

    return User.fromJson(json);
  }

  Future<User> postUser(User user) async {
    final url = Uri.parse('$apiPath/user');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode(user.toJson());

    final response = await http.post(url, headers: headers, body: body);
    final jsonResponse = jsonDecode(response.body);

    return User.fromJson(jsonResponse);
  }
}
