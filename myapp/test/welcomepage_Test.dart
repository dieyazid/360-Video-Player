// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/Redux/appstate.dart';
import 'package:myapp/Redux/reducers.dart';
import 'package:myapp/screens/Login_Screen/login.dart';
import 'package:myapp/screens/Signup_screen/signuppage.dart';
import 'package:myapp/screens/Welcome_Screen/welcome.dart';
import 'package:redux/redux.dart';

void main() {
  Widget createWidgetForTesting({required Widget child}) {
    final _initialState =
        AppState(Usermail_state: "", Username_state: "", VideosList_state: []);
    final Store<AppState> _store =
        Store<AppState>(reducer, initialState: _initialState);
    return StoreProvider<AppState>(
      store: _store,
      child: MaterialApp(
        home: child,
      ),
    );
  }

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: const WelcomePage()));
    // Testing to see if the widget is built correctly
    expect(find.byType(Container), findsWidgets);
    expect(find.text("Welcome!"), findsOneWidget);
    expect(find.byKey(const Key("redirect_loginpage")), findsOneWidget);
    expect(find.byKey(const Key("redirect_signuppage")), findsOneWidget);
    
    // Testing Buttons:

    //Login Redirect Button
    await tester.tap(
      find.byKey(const Key("redirect_loginpage")));
    await tester.pumpAndSettle();
    expect(find.byType(LoginPage), findsOneWidget);
    
    // Back button in The login page
    await tester.tap(
      find.byKey(const Key("back_button")));
    await tester.pumpAndSettle();
    
    // Back button in The signup page
    await tester.tap(
      find.byKey(const Key("redirect_signuppage")),
    warnIfMissed: false);
    await tester.pumpAndSettle();
    expect(find.byType(SignUpPage), findsOneWidget);
  });
}
