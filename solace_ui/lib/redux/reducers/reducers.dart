import 'package:flutter/material.dart';
import 'package:solace_ui/main.dart';

import '../actions/actions.dart';
import '../app_state.dart';
import 'package:redux/redux.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    loginInfo: loginInfoReducer(state.loginInfo, action),
    signupInfo: signupInfoReducer(state.signupInfo, action),
    userInfo: userInfoReducer(state.userInfo, action),
  );
}

LoginInfo loginInfoReducer(LoginInfo state, action) {
  return LoginInfo(
    email: loginEmailReducer(state.email, action),
    password: loginPasswordReducer(state.password, action),
  );
}

SignupInfo signupInfoReducer(SignupInfo state, action) {
  return SignupInfo(
    email: signupEmailReducer(state.email, action),
    password: signupPasswordReducer(state.password, action),
    firstName: signupFNameReducer(state.firstName, action),
    lastName: signupLNameReducer(state.lastName, action),
    birthdate: signupBirthdateReducer(state.birthdate, action),
    sex: signupSexReducer(state.sex, action),
    ethnicity: signupEthnicityReducer(state.ethnicity, action),
  );
}

final userInfoReducer = combineReducers<UserInfo> ([
  TypedReducer<UserInfo, UpdateUserInfoSuccess>(
      _updateUserInfoSuccessReducer),
  TypedReducer<UserInfo, UpdateUserInfoFailure>(
      _updateUserInfoFailureReducer),
]);

UserInfo _updateUserInfoSuccessReducer(UserInfo state, UpdateUserInfoSuccess action) {
  state = new UserInfo(
    email: action.info.email,
    firstName: action.info.firstName,
    lastName: action.info.lastName,
    birthdate: action.info.birthdate,
    sex: action.info.sex,
    ethnicity: action.info.ethnicity,
  );

  return state;
} // Update UserInfo state

UserInfo _updateUserInfoFailureReducer(UserInfo state, UpdateUserInfoFailure action) {
  return state;
} // Display failure message

final loginEmailReducer = combineReducers<String>([
  TypedReducer<String, UpdateLoginEmailAction>(_updateLoginEmailReducer),
]);

String _updateLoginEmailReducer(String state, UpdateLoginEmailAction action) {
  return action.email;
}

final loginPasswordReducer = combineReducers<String>([
  TypedReducer<String, UpdateLoginPasswordAction>(_updateLoginPasswordReducer),
]);

String _updateLoginPasswordReducer(
    String state, UpdateLoginPasswordAction action) {
  return action.password;
}

final signupEmailReducer = combineReducers<String>([
  TypedReducer<String, UpdateSignupEmailAction>(_updateSignupEmailReducer),
]);

String _updateSignupEmailReducer(String state, UpdateSignupEmailAction action) {
  return action.email;
}

final signupPasswordReducer = combineReducers<String>([
  TypedReducer<String, UpdateSignupPasswordAction>(
      _updateSignupPasswordReducer),
]);

String _updateSignupPasswordReducer(
    String state, UpdateSignupPasswordAction action) {
  return action.password;
}

final signupFNameReducer = combineReducers<String>([
  TypedReducer<String, UpdateSignupFNameAction>(_updateSignupFNameReducer),
]);

String _updateSignupFNameReducer(String state, UpdateSignupFNameAction action) {
  return action.firstName;
}

final signupLNameReducer = combineReducers<String>([
  TypedReducer<String, UpdateSignupLNameAction>(_updateSignupLNameReducer),
]);

String _updateSignupLNameReducer(String state, UpdateSignupLNameAction action) {
  return action.lastName;
}

final signupBirthdateReducer = combineReducers<DateTime>([
  TypedReducer<DateTime, UpdateSignupBirthdateAction>(
      _updateSignupBirthdateReducer),
]);

DateTime _updateSignupBirthdateReducer(
    DateTime state, UpdateSignupBirthdateAction action) {
  return action.birthdate;
}

final signupSexReducer = combineReducers<String>(
    [TypedReducer<String, UpdateSignupSexAction>(_updateSignupSexReducer)]);

String _updateSignupSexReducer(String state, UpdateSignupSexAction action) {
  return action.sex;
}

final signupEthnicityReducer = combineReducers<String>([
  TypedReducer<String, UpdateSignupEthnicityAction>(
      _updateSignupEthnicityReducer)
]);

String _updateSignupEthnicityReducer(
    String state, UpdateSignupEthnicityAction action) {
  return action.ethnicity;
}
