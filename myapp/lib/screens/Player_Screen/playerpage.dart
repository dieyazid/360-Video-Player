import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/components/drawer.dart';
import 'package:myapp/screens/Home_Screen/home.dart';
import 'package:myapp/screens/Welcome_Screen/welcome.dart';
import 'package:video_player_extra/video_player_extra.dart';
import 'dart:math';
import 'package:myapp/screens/Player_Screen/lowpass.dart';
import 'package:motion_sensors/motion_sensors.dart';
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
          child: _BumbleBeeRemoteVideo(
              url: 'https://videojs-vr.netlify.app/samples/eagle-360.mp4',
              mediaFormat: MediaFormat.VR2D360)),
      // Container(
      //   height:
      //       deviceHeight - ((deviceHeight / 1.2 + deviceHeight * 0.07)),
      //   width: double.infinity,
      //   decoration: const BoxDecoration(
      //     color: base_color,
      //     borderRadius: BorderRadius.only(
      //       bottomLeft: Radius.circular(18),
      //       bottomRight: Radius.circular(18),
      //       // ),
      //     ),
      //   ),
      //   // margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),

      // ),
      // NormalVideo_Player()
      // Container(
      //   decoration: const BoxDecoration(
      //     color: second_color,
      //     borderRadius: BorderRadius.all(Radius.circular(18)),
      //     // topLeft: Radius.circular(18),
      //     // topRight: Radius.circular(18),
      //     // ),
      //   ),
      //   height: deviceHeight - ((deviceHeight / 3 + deviceHeight * 0.07)),
      //   width: double.infinity,
      //   // color: second_color,
      //   padding: const EdgeInsets.all(10),
      // ),
    );
  }
}

class _BumbleBeeRemoteVideo extends StatefulWidget {
  final String url;
  final int mediaFormat;

  const _BumbleBeeRemoteVideo({
    Key? key,
    required this.url,
    required this.mediaFormat,
  }) : super(key: key);

  @override
  _BumbleBeeRemoteVideoState createState() => _BumbleBeeRemoteVideoState();
}

double _cameraPitch = 0;
double _cameraYaw = 0;
Vector3 _magnetometer = Vector3.zero();
Vector3 _accelerometer = Vector3.zero();
Vector3 _absoluteOrientation = Vector3.zero();
int interval = Duration.microsecondsPerSecond ~/ 60;
double x = 0, y = 0, z = 0, smoothSpeed = 0.125;

class _BumbleBeeRemoteVideoState extends State<_BumbleBeeRemoteVideo> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      widget.url,
      videoPlayerOptions: VideoPlayerOptions(
        mixWithOthers: true,
        mediaFormat: widget.mediaFormat,
      ),
    );

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize();

    motionSensors.accelerometerUpdateInterval = interval;
    motionSensors.magnetometerUpdateInterval = interval;
    motionSensors.orientationUpdateInterval = interval;

    // motionSensors.accelerometer.listen((AccelerometerEvent event) {
    //   setState(
    //       () => _accelerometer = applyLowPassFilter(event, _accelerometer));
    // });

    // motionSensors.magnetometer.listen((MagnetometerEvent event) {
    //   setState(() {
    //     _magnetometer = applyLowPassFilter(event, _magnetometer);
    //     var matrix =
    //         motionSensors.getRotationMatrix(_accelerometer, _magnetometer);
    //     _absoluteOrientation.setFrom(motionSensors.getOrientation(matrix));

    //     x = degrees(_absoluteOrientation.x)+_cameraPitch;
    //     y = degrees(_absoluteOrientation.y)+_cameraPitch;
    //     z = degrees(_absoluteOrientation.z);
    //     _controller.setCameraRotation(0,-y + 90, x);
    //       //print("x=$x y=$y z=$z \r\n");
    //   });
    // });
    motionSensors.orientation.listen((event) {
      _absoluteOrientation = applyLowPassFilter(event, _absoluteOrientation);
      x = degrees(_absoluteOrientation[0]);
      y = degrees(_absoluteOrientation[1]);
      z = degrees(_absoluteOrientation[2]);
      _controller.setCameraRotation(z, 0, x);
      // print(
      //     "roll=${degrees(event.roll)} pitch=${degrees(event.pitch)} yaw=${degrees(event.yaw)} \r");
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(padding: const EdgeInsets.only(top: 20.0)),
          Text(
            "Video Preview",
            maxLines: 2,
            textAlign: TextAlign.center,
            style: GoogleFonts.nunito(
                fontSize: 18, fontWeight: FontWeight.w800, color: Colors.white),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  VideoPlayer(_controller),
                  _ControlsOverlay(controller: _controller),
                  VideoProgressIndicator(_controller, allowScrubbing: true),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ControlsOverlay extends StatelessWidget {
  const _ControlsOverlay({Key? key, required this.controller})
      : super(key: key);

  static const _examplePlaybackRates = [
    0.25,
    0.5,
    1.0,
    1.5,
    2.0,
    3.0,
    5.0,
    10.0,
  ];

  static const _mediaFormats = {
    MediaFormat.STANDARD: "Standard",
    MediaFormat.VR2D180: "Monoscopic 180",
    MediaFormat.VR2D360: "Monoscopic 360",
    MediaFormat.VR3D180_OU: "Stereoscopic 180 OverUnder",
    MediaFormat.VR3D180_SBS: "Stereoscopic 180 SideBySide",
    MediaFormat.VR3D360_OU: "Stereoscopic 360 OverUnder",
    MediaFormat.VR3D360_SBS: "Stereoscopic 360 SideBySide",
  };

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 50),
          reverseDuration: const Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? const SizedBox.shrink()
              : Container(
                  color: Colors.black26,
                  child: const Center(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 100.0,
                      semanticLabel: 'Play',
                    ),
                  ),
                ),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
          onPanUpdate: (details) {
            double touchX = details.delta.dx;
            double touchY = details.delta.dy;
            double r = 0;
            double cr = cos(r);
            double sr = sin(r);
            _cameraYaw -= cr * touchX - sr * touchY;
            _cameraPitch += sr * touchX + cr * touchY;
            _cameraPitch = max(-45, min(45, _cameraPitch));
            //controller.setCameraRotation(0.0, _cameraPitch, _cameraYaw);
          },
        ),
        // Align(
        //   alignment: Alignment.topRight,
        //   child: PopupMenuButton<double>(
        //     initialValue: controller.value.playbackSpeed,
        //     tooltip: 'Playback speed',
        //     onSelected: (speed) {
        //       controller.setPlaybackSpeed(speed);
        //     },
        //     itemBuilder: (context) {
        //       return [
        //         for (final speed in _examplePlaybackRates)
        //           PopupMenuItem(
        //             value: speed,
        //             child: Text('${speed}x'),
                    
        //           )
        //       ];
        //     },
        //     child: Padding(
        //       padding: const EdgeInsets.symmetric(
        //         // Using less vertical padding as the text is also longer
        //         // horizontally, so it feels like it would need more spacing
        //         // horizontally (matching the aspect ratio of the video).
        //         vertical: 12,
        //         horizontal: 16,
        //       ),
        //       child: Text('${controller.value.playbackSpeed}x'),
        //     ),
        //   ),
        // ),
        Align(
          alignment: Alignment.topLeft,
          child: PopupMenuButton<int>(
            initialValue: controller.value.mediaFormat,
            tooltip: 'Switch between media format',
            onSelected: (format) {
              controller.setMediaFormat(format);
            },
            itemBuilder: (context) {
              return [
                for (var keyvalue in _mediaFormats.entries)
                  PopupMenuItem(
                    value: keyvalue.key,
                    child: Text(keyvalue.value),
                  ),
              ];
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                // Using less vertical padding as the text is also longer
                // horizontally, so it feels like it would need more spacing
                // horizontally (matching the aspect ratio of the video).
                vertical: 12,
                horizontal: 16,
              ),
              child: Text(_mediaFormats[controller.value.mediaFormat]!),
            ),
          ),
        ),
      ],
    );
  }
}
