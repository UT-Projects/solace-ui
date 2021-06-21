class AppState {
  final LoginInfo loginInfo;
  final SignupInfo signupInfo;

  factory AppState.initial() {
    return AppState(
      loginInfo: LoginInfo.initial(),
      signupInfo: SignupInfo.initial(),
    );
  }

  AppState({
    required this.loginInfo,
    required this.signupInfo,
  });
}

class LoginInfo {
  final String email;
  final String password;

  factory LoginInfo.initial() {
    return LoginInfo(
      email: "",
      password: "",
    );
  }

  const LoginInfo({
    required this.email,
    required this.password,
  });
}

class SignupInfo {
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final DateTime birthdate;
  final String sex;
  final String ethnicity;

  factory SignupInfo.initial() {
    return SignupInfo(
      email: "",
      password: "",
      firstName: "",
      lastName: "",
      birthdate: DateTime(1970),
      sex: "Prefer not to answer",
      ethnicity: "Prefer not to answer",
    );
  }

  const SignupInfo({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.birthdate,
    required this.sex,
    required this.ethnicity,
  });
}
