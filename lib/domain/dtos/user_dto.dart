class UserDto {
  String? login;
  String? password;
  String? mail;

  UserDto({ this.login, this.password, this.mail});

  UserDto.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    password = json['password'];
    mail = json['mail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['login'] = this.login;
    data['password'] = this.password;
    data['mail'] = this.mail;
    return data;
  }
}
