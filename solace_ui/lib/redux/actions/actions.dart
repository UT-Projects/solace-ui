import "../app_state.dart";

class CreateUserAction {
  final String firstName;
  final String lastName;
  final String email;
  final DateTime birthdate;
  final String sex;
  final String ethnicity;

  CreateUserAction({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.birthdate,
    required this.sex,
    required this.ethnicity,
  });
}

class UpdateUserInfoSuccess {
  final UserInfo info;

  UpdateUserInfoSuccess(this.info);
}

class UpdateUserInfoFailure {
  final String message;

  UpdateUserInfoFailure(this.message);
}
