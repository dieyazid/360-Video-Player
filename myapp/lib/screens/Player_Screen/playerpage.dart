import 'package:flutter/material.dart';
import 'package:myapp/components/drawer.dart';
import 'package:myapp/screens/Home_Screen/home.dart';
import 'package:myapp/screens/Player_Screen/videoplayer.dart';
import 'package:myapp/screens/Welcome_Screen/welcome.dart';

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
      body: SingleChildScrollView(child: Video_Player()),
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
