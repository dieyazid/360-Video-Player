// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:myapp/screens/splash.dart';
import 'package:myapp/screens/welcome.dart';
import 'package:myapp/redux/reducers.dart';
import 'package:myapp/redux/actions.dart';
import 'package:myapp/redux/appstate.dart';
import 'package:redux/redux.dart';

void main() {
  final _initialState = AppState(Usermail_state: "",Username_state: "",VideosList_state:[] );
  final Store<AppState> _store =
      Store<AppState>(reducer, initialState: _initialState);
  runApp(MyApp(store: _store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;
  MyApp({required this.store});

  // This widget is the root of our application.
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.bottom, //This line is used for showing the bottom bar
    ]);
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Login',
        theme: ThemeData(
          primaryColor: base_color,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
