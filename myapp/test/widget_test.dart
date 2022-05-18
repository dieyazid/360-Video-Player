// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/main.dart';
import 'package:myapp/Redux/appstate.dart';
import 'package:myapp/Redux/reducers.dart';
import 'package:redux/redux.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
     final _initialState = AppState(Usermail_state: "",Username_state: "",VideosList_state:[] );
  final Store<AppState> _store =
      Store<AppState>(reducer, initialState: _initialState);
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(store:_store));

    // Verify that our counter starts at 0.
    // expect(find.text('0'), findsOneWidget);
    // expect(find.text('1'), findsNothing);
    // Tap the '+' icon and trigger a frame.
    // await tester.tap(find.byIcon(Icons.add));
    
    await tester.pump();
    // Verify that our counter has incremented.
    // expect(find.text('0'), findsNothing);
    // expect(find.text('1'), findsOneWidget);
  });
}
