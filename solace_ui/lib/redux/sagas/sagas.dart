import 'package:redux_saga/redux_saga.dart';
import '../actions/actions.dart';
import '../app_state.dart';
import '../../api.dart' as api;

mySaga() sync* {
  yield TakeEvery(createPatient, pattern: CreateUserAction);
}

createPatient({dynamic action}) sync* {
  yield Try(() sync* {
    var res = Result();
    yield Call(api.createPatient,
        args: [action.firstName + action.lastName, action.birthdate, action.email, action.sex],
        result: res);
    var uuid = res.value;
    yield Put(UpdateUserInfoSuccess(
      UserInfo(
        uuid: uuid,
        firstName: action.name,
        lastName: action.name,
        birthdate: action.birthdate,
        email: action.email,
        sex: action.sex,
        ethnicity: ""),
    ));
  }, Catch: (e, s) sync* {
    yield Put(UpdateUserInfoFailure(e.message));
  });
}

updatePatient({dynamic action}) sync* {
  yield Try(() sync* {
    var info = Result();
    yield Call(api.getPatientInfo, args: [action.uuid], result: info);
    var user = info.value;
    yield Put(UpdateUserInfoSuccess(
      UserInfo(
        uuid: user.uuid,
        firstName: user.name,
        lastName: user.name,
        birthdate: DateTime.fromMillisecondsSinceEpoch(user.birthdate),
        email: user.email,
        sex: action.sex,
        ethnicity: "")));
  }, Catch: (e, s) sync* {
    yield Put(UpdateUserInfoFailure(e.message));
  });
}