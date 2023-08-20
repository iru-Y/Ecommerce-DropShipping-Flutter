class User {
  String? _id;
  String? _login;
  String? _password;
  String? _token;

  User(
      {String? id,
      String? login,
      String? password,
      String? mail,
      String? token}) {
    if (id != null) {
      _id = id;
    }
    if (login != null) {
      _login = login;
    }
    if (password != null) {
      _password = password;
    }
    if (token != null) {
      _token = token;
    }
  }

  // ignore: unnecessary_getters_setters
  String? get id => _id;
  set id(String? id) => _id = id;
  // ignore: unnecessary_getters_setters
  String? get login => _login;
  set login(String? login) => _login = login;
  // ignore: unnecessary_getters_setters
  String? get password => _password;
  set password(String? password) => _password = password;
  // ignore: unnecessary_getters_setters
  String? get token => _token;
  set token(String? token) => _token = token;
  // ignore: unnecessary_getters_setters

  User.fromJson(Map<String, dynamic> json) {
    _id = json['id'] ?? '';
    _login = json['login'] ?? '';
    _password = json['password'] ?? '';
    _token = json['token'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id ?? '';
    data['login'] = _login ?? '';
    data['password'] = _password ?? '';
    data['token'] = _token ?? '';

    return data;
  }
}
