import 'package:myapp/Redux/appstate.dart';
import 'package:myapp/Redux/actions.dart';

AppState reducer(AppState prevState, dynamic action) {
  AppState newState = AppState.fromAppState(prevState);
  if (action is Usermail_action) {
    newState.Usermail_state = action.payload;
  } 
  if (action is Username_action) {
    newState.Username_state = action.payload;
  } 
  if (action is VideosList_action) {
    newState.VideosList_state = action.payload;
  }
  return newState;
  }

  
