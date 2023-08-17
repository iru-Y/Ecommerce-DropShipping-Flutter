import 'package:flutter/material.dart';

import '../models/user.dart';
import '../repositories/user_repoisotory.dart';

class LoginController {
  final UserRepository userService = UserRepository();

  Future<User> login(String login, String password) async {
    final user = await userService.getAll();
    final findUser = user.firstWhere((element) => element.login == login,
        orElse: () => throw Exception('Não existe usuário para este login'));

    if (findUser != null && findUser.password == password) {
      return findUser;
    }

    throw Exception('Algo deu errado');
  }

  
}

class RegisterController {
  final UserRepository _userService = UserRepository();
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  final _mailController = TextEditingController();

  get loginController => _loginController;
  get passwordController => _passwordController;
  get mailController => _mailController;

  Future<void> register(BuildContext context) async {
    String login = loginController.text;
    String password = passwordController.text;
    String mail = mailController.text;

    final user = User(login: login, password: password, mail: mail);
    if (login.length < 3 || password.length < 8 || mail.length < 3) {
      throw Exception('As informações não podem ficar em branco');
    }

    await _userService.postUser(user);
  }
}
