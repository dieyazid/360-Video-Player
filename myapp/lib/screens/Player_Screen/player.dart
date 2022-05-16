import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/components/drawer.dart';
import 'package:myapp/screens/Home_Screen/home.dart';
import 'package:myapp/screens/Welcome_Screen/welcome.dart';
import 'package:video_player/video_player.dart';

class PlayerPage extends StatefulWidget {
  // final String videotitle, videoduration;
  // required this.videotitle,required this.videoduration
  const PlayerPage({Key? key, }) : super(key: key);
  @override
  PlayerPage_ createState() => PlayerPage_();
}

// ignore: camel_case_types
class PlayerPage_ extends State<PlayerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
        preferredSize:Size.fromHeight(deviceHeight*0.07), 
        child:AppBar(backgroundColor: base_color,
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
        child: Column(
          children: [ VideoApp(),
          Container(
            height: deviceHeight - ((deviceHeight/3+deviceHeight*0.07 )),
            width: double.infinity,
            color: second_color,
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  color: second_color,
                  width: double.infinity,
                  margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                  "Title",
                  style: GoogleFonts.nunito(
                      fontSize: 18, fontWeight: FontWeight.w800),
                              ),
                              Text(
                  "Duration : xx:xx",
                  style: GoogleFonts.nunito(
                      fontSize: 18, fontWeight: FontWeight.w800),
                              ),
                            ],
                          ),
                ),
                
              ],
            ),
          ),]
        ),
      )
    );
  }
}



class VideoApp extends StatefulWidget {
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'rtmp://62.113.210.250/medienasa-live/rbw_high')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
            onTap: () {setState(() {
                _controller.value.isPlaying
                    ? _controller.pause()
                    : _controller.play();
              }
              );},
      child: Container(
        height: deviceHeight/3,
            width: double.infinity,
            color: base_color,
          child: Stack(
            children: [
               Center(
                child: _controller.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        
                          child: VideoPlayer(_controller),
                      )
                    : Container(
                    ),
                        ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                  _controller.value.isPlaying
                      ? _controller.pause()
                      : _controller.play();
                }
                );
                    },
                    child: Icon(
                _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,color: base_color,
              ),
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      // padding: const EdgeInsets.all(5),
                      primary: second_color,
                    ),
                  ),
          ),
           ]),
    ),
          
          
        
      ); }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}