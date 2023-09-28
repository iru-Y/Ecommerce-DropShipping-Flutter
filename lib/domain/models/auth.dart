class Auth<T> {
  String? token;
  T? user;

  Auth({this.token, this.user});

  Auth.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['user'] = user;
    return data;
  }
}
