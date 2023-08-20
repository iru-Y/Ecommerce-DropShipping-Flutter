import '../models/user.dart';
import '../repositories/auth_repoisotory.dart';


class UserController {
  final UserRepository userService = UserRepository();

  Future<User> login(String login, String password) async {
    
    final user = await userService.getAll();
    final findUser = user.firstWhere((element) => element.login == login,
        orElse: () => throw Exception('Não existe usuário para este login'));

    if (findUser.password == password) {
      return findUser;
    }

    throw Exception('Algo deu errado');
  }

   Future<void> register(String login, String password) async {
    final user = User(login: login, password: password);
    if (login.length < 3 || password.length < 8 ) {
      throw Exception('As informações não podem ficar em branco');
    }

    await userService.postUser(user);
  }
}
