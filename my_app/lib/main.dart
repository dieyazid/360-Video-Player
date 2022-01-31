import 'package:flutter/material.dart';
import 'package:video_360/video_360.dart';
import 'package:intl/intl.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Video360Controller controller;

  num duration = 0;
  num total = 0;
  NumberFormat formatter = new NumberFormat("00");

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var statusBar = MediaQuery.of(context).padding.top;

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Video 360 Plugin example app'),
      ),
      body: Stack(
        children: [
          Center(
            child: Container(
              width: width,
              height: height,
              child: Video360View(
                onVideo360ViewCreated: _onVideo360ViewCreated,
                url:
                    'https://videojs-vr.netlify.app/samples/eagle-360.mp4',
                onPlayInfo: (Video360PlayInfo info) {
                  setState(() {
                    duration = info.duration;
                    total = info.total;
                  });
                },
              ),
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    onPressed: () {
                      controller.play();
                    },
                    color: Colors.grey[100],
                    child: Text('Play'),
                  ),
                  MaterialButton(
                    onPressed: () {
                      controller.stop();
                    },
                    color: Colors.grey[100],
                    child: Text('Stop'),
                  ),
                  MaterialButton(
                    onPressed: () {
                      controller.reset();
                    },
                    color: Colors.grey[100],
                    child: Text('Reset'),
                  ),
                  MaterialButton(
                    onPressed: () {
                      controller.jumpTo(80000);
                    },
                    color: Colors.grey[100],
                    child: Text('1:20'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    onPressed: () {
                      controller.seekTo(-2000);
                    },
                    color: Colors.grey[100],
                    child: Text('<<'),
                  ),
                  MaterialButton(
                    onPressed: () {
                      controller.seekTo(2000);
                    },
                    color: Colors.grey[100],
                    child: Text('>>'),
                  ),
                  Flexible(
                    child: MaterialButton(
                      onPressed: () {},
                      color: Colors.grey[100],
                      child: Text(
                          '${formatter.format(duration/1000/60)}:${formatter.format(duration/1000%60)}/ ${formatter.format(total/1000/60)}:${formatter.format(total/1000%60)}'),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  _onVideo360ViewCreated(Video360Controller controller) {
    this.controller = controller;
  }
}
