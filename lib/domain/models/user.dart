class User {
  String? _id;
  String? _login;
  String? _password;
  String? _mail;

  User({String? id, String? login, String? password, String? mail}) {
    if (id != null) {
      _id = id;
    }
    if (login != null) {
      _login = login;
    }
    if (password != null) {
      _password = password;
    }
    if (mail != null) {
      _mail = mail;
    }
  }

  String? get id => _id;
  set id(String? id) => _id = id;
  String? get login => _login;
  set login(String? login) => _login = login;
  String? get password => _password;
  set password(String? password) => _password = password;
  String? get mail => _mail;
  set mail(String? mail) => _mail = mail;

  User.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _login = json['login'];
    _password = json['password'];
    _mail = json['mail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['login'] = _login;
    data['password'] = _password;
    data['mail'] = _mail;
    return data;
  }
}