import 'package:shared_preferences/shared_preferences.dart';

class SharedLogin {
  static Future<void> setLoginCredentials(String mail) async {
    final SharedPreferences sharedLogin = await SharedPreferences.getInstance();
    await sharedLogin.setString('mail', mail);
    print('Printando o setLogin N1: $mail');
  }

  static Future<String?> getLoginCredentials(
      String mailKey) async {
    final SharedPreferences sharedLogin = await SharedPreferences.getInstance();
    final String? mail = sharedLogin.getString('mail');
    print('Printando o getLogin N2: $mail');
    return mail;
  }

  static Future<void> deleteLoginCredentials() async {
    final SharedPreferences sharedLogin = await SharedPreferences.getInstance();
    await sharedLogin.remove('mail');
  }
}
