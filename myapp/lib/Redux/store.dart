// ignore_for_file: unnecessary_new

import 'package:myapp/Redux/appstate.dart';
import 'package:myapp/Redux/reducers.dart';
import 'package:redux/redux.dart';

Store<AppState> store = new Store(reducer, initialState: new AppState());
