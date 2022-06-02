import 'package:flutter_redux/flutter_redux.dart';
import 'package:myapp/Redux/actions.dart';
import 'package:myapp/Redux/appstate.dart';
import 'package:myapp/Redux/store.dart';

void dispatch(context, action, value) {
  StoreProvider.of<AppState>(context)
            .dispatch(action(value));
}
