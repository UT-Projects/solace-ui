import 'package:flutter/material.dart';
import 'package:solace_ui/main.dart';

import '../actions/actions.dart';
import '../app_state.dart';
import 'package:redux/redux.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    loginInfo: loginInfoReducer(state.loginInfo, action),
    userInfo: userInfoReducer(state.userInfo, action),
  );
}

LoginInfo loginInfoReducer(LoginInfo state, action) {
  return LoginInfo(
    email: loginEmailReducer(state.email, action),
    password: loginPasswordReducer(state.password, action),
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