import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/components/drawer.dart';
import 'package:myapp/screens/Home_Screen/home.dart';
import 'package:myapp/screens/Welcome_Screen/welcome.dart';
import 'package:ext_video_player/ext_video_player.dart';
import 'package:vector_math/vector_math_64.dart' hide Colors;

class PlayerPage extends StatefulWidget {
  // final String videotitle, videoduration;
  // required this.videotitle,required this.videoduration
  const PlayerPage({
    Key? key,
  }) : super(key: key);
  @override
  PlayerPage_ createState() => PlayerPage_();
}

// ignore: camel_case_types
class PlayerPage_ extends State<PlayerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: base_color,
        resizeToAvoidBottomInset: true,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(deviceHeight * 0.07),
          child: AppBar(
            backgroundColor: base_color,
            title: const Center(child: Text("Panorama Video Player")),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return const HomePage();
                    }),
                  );
                },
                child: const Icon(
                  Icons.home,
                  size: 26,
                ),
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(10),
                  primary: base_color,
                ),
              ),
            ],
          ),
        ),
        drawer: const Drawer(
          child: DrawerList(),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Video_Player(),
            Container(
               height: deviceHeight - ((deviceHeight / 1.2 + deviceHeight * 0.07)),
              width: double.infinity,
                    decoration: const BoxDecoration(
                      color: base_color,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(18),
                        bottomRight: Radius.circular(18),
                      // ),
                    ),),
                    // margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Title",maxLines: 2,textAlign: TextAlign.center,
                        style: GoogleFonts.nunito(
                            fontSize: 18, fontWeight: FontWeight.w800,color:Colors.white),
                      ),
                    ),
                  ),
            Container(
              decoration: const BoxDecoration(
                      color: second_color,
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                        // topLeft: Radius.circular(18),
                        // topRight: Radius.circular(18),
                      // ),
                    ),
              height: deviceHeight - ((deviceHeight / 3 + deviceHeight * 0.07)),
              width: double.infinity,
              // color: second_color,
              padding: const EdgeInsets.all(10),
            ),
            
          ]),
        ));
  }
}

class Video_Player extends StatefulWidget {
  @override
  _Video_PlayerState createState() => _Video_PlayerState();
}

class _Video_PlayerState extends State<Video_Player> {
  late VideoPlayerController _controller;
  final double _cameraPitch = 0;
  final double _cameraYaw = 0;
  final Vector3 _magnetometer = Vector3.zero();
  final Vector3 _accelerometer = Vector3.zero();
  final Vector3 _absoluteOrientation = Vector3.zero();
  int interval = Duration.microsecondsPerSecond ~/ 60;
  double x = 0, y = 0, z = 0, smoothSpeed = 0.125;
// rtmp://62.113.210.250/medienasa-live/rbw_high
// rtmp://192.168.1.12/live/bbb
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'rtmp://192.168.43.184/live/bbb')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _controller.value.initialized
          ? AspectRatio(
            
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(children: [
                GestureDetector(
                    onTap: () {
                      setState(() {
                        _controller.value.isPlaying
                            ? _controller.pause()
                            : _controller.play();
                      });
                    },
                    child: VideoPlayer(_controller)),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: VideoProgressIndicator(
                    _controller,
                    allowScrubbing: true,
                    padding: const EdgeInsets.all(3),
                    colors: VideoProgressColors(
                        playedColor: Theme.of(context).primaryColor),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _controller.value.isPlaying
                            ? _controller.pause()
                            : _controller.play();
                      });
                    },
                    child: Icon(
                      _controller.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                      color: base_color,
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(5),
                      primary: second_color,
                    ),
                  ),
                ),
              ]),
            )
          : const SizedBox(
              // height: deviceHeight - (deviceHeight / 12 + 15),
              child: Center(
                  child: SpinKitFadingCircle(size: 60, color: Colors.white)),
            ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
