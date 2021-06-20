class AppState {
  LoginInfo loginInfo;
  SignupInfo signupInfo;

  AppState({
    this.loginInfo = const LoginInfo(email: "", password: ""),
    this.signupInfo =
        const SignupInfo(email: "", password: "", firstName: "", lastName: ""),
  });
}

class LoginInfo {
  final String email;
  final String password;

  const LoginInfo({
    this.email,
    this.password,
  });
}

class SignupInfo {
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final DateTime birthdate;

  const SignupInfo({
    this.email,
    this.password,
    this.firstName,
    this.lastName,
    this.birthdate,
  });
}
