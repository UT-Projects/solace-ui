import "../app_state.dart";

class UpdateLoginEmailAction {
  final String email;

  UpdateLoginEmailAction(this.email);
}

class UpdateLoginPasswordAction {
  final String password;

  UpdateLoginPasswordAction(this.password);
}

class UpdateSignupEmailAction {
  final String email;

  UpdateSignupEmailAction(this.email);
}

class UpdateSignupPasswordAction {
  final String password;

  UpdateSignupPasswordAction(this.password);
}

class UpdateSignupFNameAction {
  final String firstName;

  UpdateSignupFNameAction(this.firstName);
}

class UpdateSignupLNameAction {
  final String lastName;

  UpdateSignupLNameAction(this.lastName);
}

class UpdateSignupBirthdateAction {
  final DateTime birthdate;

  UpdateSignupBirthdateAction(this.birthdate);
}

class UpdateSignupSexAction {
  final String sex;

  UpdateSignupSexAction(this.sex);
}

class UpdateSignupEthnicityAction {
  final String ethnicity;

  UpdateSignupEthnicityAction(this.ethnicity);
}

class CreateUserAction {
  final String firstName;
  final String lastName;
  final String email;
  final DateTime birthdate;
  final String sex;

  CreateUserAction({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.birthdate,
    required this.sex,
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