// ignore_for_file: non_constant_identifier_names

// import 'package:ext_video_player/ext_video_player.dart';

class AppState {
  late List VideosList_state = [];
  late String Usermail_state = "";
  late String Username_state = "Guest";
  late String Url_state =
      'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4';
  // late VideoPlayerController Controller_state =
  //     VideoPlayerController.network('');
  AppState();
  // this.Usermail_state);
// required this.Usermail_state,
  // required this.VideosList_state,
  AppState.fromAppState(AppState another) {
    // VideosList_state = another.VideosList_state;
    Usermail_state = another.Usermail_state;
    Username_state = another.Username_state;
    VideosList_state = another.VideosList_state;
    Url_state = another.Url_state;
  }
}
// {'title': 'title',
//         'thumbnail': 'thumbnail',
//         'duration': 'duration'}