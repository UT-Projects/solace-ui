import 'package:flutter/material.dart';
import 'package:solace_ui/main.dart';

import '../actions/actions.dart';
import '../app_state.dart';
import 'package:redux/redux.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    userInfo: userInfoReducer(state.userInfo, action),
    symptoms: symptomsReducer(state.symptoms, action),
  );
}

final userInfoReducer = combineReducers<UserInfo>([
  TypedReducer<UserInfo, UpdateUserInfoSuccess>(_updateUserInfoSuccessReducer),
  TypedReducer<UserInfo, UpdateUserInfoFailure>(_updateUserInfoFailureReducer),
]);

UserInfo _updateUserInfoSuccessReducer(
    UserInfo state, UpdateUserInfoSuccess action) {
  state = new UserInfo(
    uuid: action.info.uuid,
    email: action.info.email,
    firstName: action.info.firstName,
    lastName: action.info.lastName,
    birthdate: action.info.birthdate,
    sex: action.info.sex,
    ethnicity: action.info.ethnicity,
  );

  return state;
} // Update UserInfo state

UserInfo _updateUserInfoFailureReducer(
    UserInfo state, UpdateUserInfoFailure action) {
  return state;
} // Display failure message

final symptomsReducer = combineReducers<Symptoms>({
  TypedReducer<Symptoms, AddSymptom>(_addSymptomReducer),
  TypedReducer<Symptoms, RemoveSymptom>(_removeSymptomReducer),
});

Symptoms _addSymptomReducer(Symptoms state, AddSymptom action) {
  print(state.symptomList.join('\n'));

  return Symptoms(
      symptomList: []
        ..addAll(state.symptomList)
        ..add(action.symptom));
}

Symptoms _removeSymptomReducer(Symptoms state, RemoveSymptom action) {
  print(state.symptomList.join('\n'));

  return Symptoms(
      symptomList: state.symptomList
          .where((symptom) => symptom != action.symptom)
          .toList());
}
