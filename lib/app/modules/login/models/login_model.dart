enum AuthMode {
  LOGIN,
  SIGNUP,
}

class LoginModel {
  String? id;
  String? name;
  String? email;
  String? password;
  // List<Department> departments = List<Department>();
  bool? active = false;
  bool? isAdmin = false;
  AuthMode _mode = AuthMode.LOGIN;

  LoginModel({
    this.id,
    this.name,
    this.email,
    this.password,
    this.active,
    this.isAdmin,
  });

  bool get isSignup {
    return _mode == AuthMode.SIGNUP;
  }

  bool get isLogin {
    return _mode == AuthMode.LOGIN;
  }

  void toggleMode() {
    _mode = _mode == AuthMode.LOGIN ? AuthMode.SIGNUP : AuthMode.LOGIN;
  }
}
