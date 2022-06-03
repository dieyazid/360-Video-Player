// ignore_for_file: constant_identifier_names, use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:myapp/screens/Splash_Screen/splash.dart';
import 'package:myapp/screens/Welcome_Screen/welcome.dart';
import 'package:myapp/Redux/appstate.dart';
import 'package:redux/redux.dart';
import 'package:myapp/Redux/store.dart';

void main() {
  // final Store<AppState> _store = Store<AppState>(reducer, initialState: _initialState);
  runApp(MyApp(store: store));
  // _store
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;
  const MyApp({required this.store});

  // This widget is the root of our application.
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky,
        overlays: [
          SystemUiOverlay.bottom,
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
