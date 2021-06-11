import '../actions/actions.dart';
import '../app_state.dart';
import 'package:redux/redux.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    placeholder: placeholderReducer(state.placeholder, action),
  );
}

final placeholderReducer = combineReducers<int>([
  TypedReducer<int, UpdatePlaceholderAction>(_updatePlaceholderReducer),
]);

int _updatePlaceholderReducer(int state, UpdatePlaceholderAction action) {
  return action.placeholder;
}
