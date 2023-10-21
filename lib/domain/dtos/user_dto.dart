class UserDto {
  String? mail;
  String? password;
  String? profileImage;
  String? name;
  String? lastName;
  UserDto({this.name, this.lastName, this.profileImage, this.password, this.mail});

  UserDto.fromJson(Map<String, dynamic> json) {
    password = json['password'];
    mail = json['mail'];
    profileImage = json['profileImage'];
    name = json['name'];
    lastName = json['lastName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['password'] = this.password;
    data['mail'] = this.mail;
    data['profileImage'] = this.profileImage;
    data['name'] = this.name;
    data['lastName'] = this.lastName;
    return data;
  }
}
