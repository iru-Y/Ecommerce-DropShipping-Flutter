import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:trizi/domain/dtos/user_dto.dart';
import 'package:trizi/utils/headers.dart';
import 'package:trizi/utils/http_router.dart';

void main() {
  test('Test Content-Type Header', () async {
    final userDt = UserDto(
        password: '91211561', mail: 'yutiritrh@hotmail.com');
    final testUrl = Uri.parse('$apiPath/users/nodata');
    final response = await http.post(
      testUrl,
      headers: jsonHeader,
      body: jsonEncode(userDt.toJson()),
    );
    expect(response.statusCode, 201);
  });
}
