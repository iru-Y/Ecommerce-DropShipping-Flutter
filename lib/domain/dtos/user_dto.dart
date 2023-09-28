class UserDto {
  String? login;
  String? password;
  String? mail;
  String? profileImage;
  String? name;
  String? lastName;
  UserDto({this.name, this.lastName, this.profileImage, this.login, this.password, this.mail});

  UserDto.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    password = json['password'];
    mail = json['mail'];
    profileImage = json['profileImage'];
    name = json['name'];
    lastName = json['lastName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['login'] = this.login;
    data['password'] = this.password;
    data['mail'] = this.mail;
    data['profileImage'] = this.profileImage;
    data['name'] = this.name;
    data['lastName'] = this.lastName;
    return data;
  }
}
