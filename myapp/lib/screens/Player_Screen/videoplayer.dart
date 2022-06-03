// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:myapp/screens/Welcome_Screen/welcome.dart';
// import 'package:ext_video_player/ext_video_player.dart';
// import 'package:vector_math/vector_math_64.dart' hide Colors;
// import 'package:myapp/Redux/store.dart';

// class Video_Player extends StatefulWidget {
//   @override
//   _Video_PlayerState createState() => _Video_PlayerState();
// }

// class _Video_PlayerState extends State<Video_Player> {
//   late VideoPlayerController _controller, _controller2;
//   final double _cameraPitch = 0;
//   final double _cameraYaw = 0;
//   final Vector3 _magnetometer = Vector3.zero();
//   final Vector3 _accelerometer = Vector3.zero();
//   final Vector3 _absoluteOrientation = Vector3.zero();
//   int interval = Duration.microsecondsPerSecond ~/ 60;
//   double x = 0, y = 0, z = 0, smoothSpeed = 0.125;
// // rtmp://62.113.210.250/medienasa-live/rbw_high
// // rtmp://192.168.1.12/live/bbb
//   @override
//   void initState() {
//     super.initState();

//     _controller = VideoPlayerController.network(store.state.Url_state)
//       ..initialize().then((_) {
//         // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
//         setState(() {});
//         // dispatch(context, Controller_action,
//         // _controller);
//       });
//     _controller2 = VideoPlayerController.network(store.state.Url_state)
//       ..initialize().then((_) {
//         // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
//         setState(() {});
//         // dispatch(context, Controller_action,
//         // _controller);
//       });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(children: [
//       SizedBox(
//         height: 50,
//         child: Align(
//           alignment: Alignment.center,
//           child: Text(
//             "Panorama Video Preview",
//             maxLines: 2,
//             textAlign: TextAlign.center,
//             style: GoogleFonts.nunito(
//                 fontSize: 18, fontWeight: FontWeight.w800, color: Colors.white),
//           ),
//         ),
//       ),
//       Center(
//         child: _controller.value.initialized
//             ? AspectRatio(
//                 aspectRatio: _controller.value.aspectRatio,
//                 child: Stack(children: [
//                   GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           _controller.value.isPlaying
//                               ? PauseVideos()
//                               : PlayVideos();
//                         });
//                       },
//                       child: VideoPlayer(_controller)),
//                   // Align(
//                   //   alignment: Alignment.bottomCenter,
//                   //   child: VideoProgressIndicator(
//                   //     _controller,
//                   //     allowScrubbing: true,
//                   //     padding: const EdgeInsets.all(3),
//                   //     colors: VideoProgressColors(
//                   //         playedColor: Theme.of(context).primaryColor),
//                   //   ),
//                   // ),
//                   Align(
//                     alignment: Alignment.bottomRight,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         setState(() {
//                           _controller.value.isPlaying
//                               ? PauseVideos()
//                               : PlayVideos();
//                         });
//                       },
//                       child: Icon(
//                         _controller.value.isPlaying
//                             ? Icons.pause
//                             : Icons.play_arrow,
//                         color: base_color,
//                       ),
//                       style: ElevatedButton.styleFrom(
//                         shape: const CircleBorder(),
//                         padding: const EdgeInsets.all(5),
//                         primary: second_color,
//                       ),
//                     ),
//                   ),
//                 ]),
//               )
//             : AspectRatio(
//                 aspectRatio: _controller.value.aspectRatio,
//                 child: const Center(
//                     child: SpinKitFadingCircle(size: 50, color: Colors.white)),
//               ),
//       ),
//       SizedBox(
//         height: 50,
//         child: Align(
//           alignment: Alignment.center,
//           child: Text(
//             "Normal Video Preview",
//             maxLines: 2,
//             textAlign: TextAlign.center,
//             style: GoogleFonts.nunito(
//                 fontSize: 18, fontWeight: FontWeight.w800, color: Colors.white),
//           ),
//         ),
//       ),
//       Center(
//         child: _controller2.value.initialized
//             ? AspectRatio(
//                 aspectRatio: _controller2.value.aspectRatio,
//                 child: Stack(children: [
//                   VideoPlayer(_controller2),
//                   // Align(
//                   //   alignment: Alignment.bottomCenter,
//                   //   child: VideoProgressIndicator(
//                   //     _controller2,
//                   //     allowScrubbing: true,
//                   //     padding: const EdgeInsets.all(3),
//                   //     colors: VideoProgressColors(
//                   //         playedColor: Theme.of(context).primaryColor),
//                   //   ),
//                   // ),
//                   // Align(
//                   //   alignment: Alignment.bottomCenter,
//                   //   child: VideoProgressIndicator(
//                   //     _controller,
//                   //     allowScrubbing: f,
//                   //     padding: const EdgeInsets.all(3),
//                   //     colors: VideoProgressColors(
//                   //         playedColor: Theme.of(context).primaryColor),
//                   //   ),
//                   // ),
//                 ]),
//               )
//             : AspectRatio(
//                 aspectRatio: _controller2.value.aspectRatio,
//                 child: const Center(
//                     child: SpinKitFadingCircle(size: 50, color: Colors.white)),
//               ),
//       )
//     ]);
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//     _controller2.dispose();
//     // store.state.Controller_state.dispose();
//   }

//   void PlayVideos() {
//     _controller.play();
//     _controller2.play();
//     // store.state.Controller_state.play();
//   }

//   void PauseVideos() {
//     _controller.pause();
//     _controller2.pause();
//     // store.state.Controller_state.pause();
//   }
// }
