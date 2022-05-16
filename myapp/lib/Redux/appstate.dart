// ignore_for_file: non_constant_identifier_names

class AppState {
  late List VideosList_state = [];
  late String Usermail_state;
  late String Username_state="Guest";
  AppState({required this.Usermail_state, required this.Username_state,required this.VideosList_state});

  AppState.fromAppState(AppState another) {
    // VideosList_state = another.VideosList_state;
    Usermail_state = another.Usermail_state;
    Username_state = another.Username_state;
    VideosList_state = another.VideosList_state;
  }
}
