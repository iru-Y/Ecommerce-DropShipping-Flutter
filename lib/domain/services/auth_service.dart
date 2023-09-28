class AuthService {
  static final AuthService _instance = AuthService._internal();

  factory AuthService() {
    return _instance;
  }

  AuthService._internal();

  String? _token;

  String? get token => _token;

  void setToken(String token) {
    _token = token;
  }
}