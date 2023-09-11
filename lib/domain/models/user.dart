class User {
  String? id;
  String? login;
  String? password;
  String? mail;
  String? role;
  String? profileImage;
  String? username;

  User(
      {this.id,
      this.login,
      this.password,
      this.mail,
      this.role,
      this.profileImage,
      this.username});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    login = json['login'];
    password = json['password'];
    mail = json['mail'];
    role = json['role'];
    profileImage = json['profileImage'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['login'] = login;
    data['password'] = password;
    data['mail'] = mail;
    data['role'] = role;
    data['profileImage'] = profileImage;
    data['username'] = username;
    return data;
  }
}