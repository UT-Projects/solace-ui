class AppState {
  final UserInfo userInfo;
  final Symptoms symptoms;

  factory AppState.initial() {
    return AppState(
      userInfo: UserInfo.initial(),
      symptoms: Symptoms.initial(),
    );
  }

  AppState({
    required this.userInfo,
    required this.symptoms,
  });
}

class UserInfo {
  final String uuid;
  final String email;
  final String firstName;
  final String lastName;
  final DateTime birthdate;
  final String sex;
  final String ethnicity;

  factory UserInfo.initial() {
    return UserInfo(
      uuid: "",
      email: "",
      firstName: "",
      lastName: "",
      birthdate: DateTime(1970),
      sex: "Prefer not to answer",
      ethnicity: "Prefer not to answer",
    );
  }

  const UserInfo({
    required this.uuid,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.birthdate,
    required this.sex,
    required this.ethnicity,
  });
}

class Symptoms {
  final Set<String> symptomList;

  factory Symptoms.initial() {
    return Symptoms(
      symptomList: Set(),
    );
  }

  const Symptoms({
    required this.symptomList,
  });
}
