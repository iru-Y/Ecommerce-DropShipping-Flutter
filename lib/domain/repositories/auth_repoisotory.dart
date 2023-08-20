import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../utils/http_router.dart';
import '../models/user.dart';

class UserRepository {
  Future<List<User>> getAll() async {
    final List<User> users = [];

    final url = await http.get(Uri.parse('$apiPath/auth/login'));

    Iterable json = jsonDecode(url.body);

    json.map((e) {
      final User user = User.fromJson(e);
      users.add(user);
    }).toList();

    return users;
  }

  // Future<String> loginUser(String username, String password) async {
  //   final url = Uri.parse('$apiPath/auth/login');
  //   final headers = {'Content-Type': 'application/json'};
  //   // ignore: unused_local_variable
  //   final body = jsonEncode(url);

  //   final response = await http.post(url, headers: headers);

  //   if (response.statusCode == 200) {
  //     final jsonResponse = jsonDecode(response.body);
  //     final token = jsonResponse['token'];
  //       // Store the token for future use
  //     return token;
  //   } else {
  //     throw Exception('Failed to login');
  //   }
  // }

  Future<User> postUser(User user) async {
    final url = Uri.parse('$apiPath/auth/login');

    final body = jsonEncode(user.token.);

    final response = await http.post(url, headers: _getHeaders(), body: body);
    final jsonResponse = await jsonDecode(response.body);
    final token = jsonResponse['token'];

     
    return User.fromJson(token);
  }

  Map<String, String> _getHeaders() {
    final headers = {
      'Content-Type': 'application/json',
    };
    return headers;
  }
}
