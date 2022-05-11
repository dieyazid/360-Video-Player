// ignore_for_file: unnecessary_new

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/components/drawer.dart';
import 'package:myapp/screens/player.dart';
import 'package:myapp/screens/welcome.dart';
import 'package:myapp/screens/welcome.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  HomePage_ createState() => HomePage_();
}

// ignore: camel_case_types
class HomePage_ extends State<HomePage> {
  // ignore: non_constant_identifier_names
  List Videos = [];
  getData() async {
    const String url = "http://localhost:3000/videos";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    for (var u in jsonData) {
      Videos.add({
        'title': u['title'],
        'thumbnail': u['thumbnail'],
        'duration': u['duration']
      });
    }
    return Videos;
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      Videos = await getData();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(deviceHeight * 0.07),
        child: AppBar(
          backgroundColor: base_color,
          title: const Center(child: Text("Panorama Video Player")),
        ),
      ),
      drawer: const Drawer(
        child: DrawerList(),
      ),
      body: SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
              height: deviceHeight - (deviceHeight / 12 + 15),
              padding: const EdgeInsets.all(10),
              color: const Color(0x0ffeaaea),
              child: SingleChildScrollView(
                child: Column(
                  children: Videos.map((video) {
                    return VideoCard(video);
                  }).toList(),
                ),
              ))
        ]),
      ),
    );
  }
}

class Video {
  final String name, email, username;

  Video(this.name, this.email, this.username);
}

class VideoCard extends StatelessWidget {
  final Map videoData;
  // ignore: use_key_in_widget_constructors
  const VideoCard(this.videoData);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(18)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              spreadRadius: 4,
              blurRadius: 6,
              offset: const Offset(0, 3),
            )
          ]),
      child: Column(children: [
        MaterialButton(
          color: Colors.white,
          shape: const CircleBorder(),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return PlayerPage();
              }),
            );
          },
          child: Container(
            height: 150,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(videoData['thumbnail']),
              fit: BoxFit.cover,
            )),
            // child: Stack(
            //   children: [
            //     // Positioned(
            //     //     top: 5,
            //     //     right: -15,
            //     //     child: MaterialButton(

            //     //       child: const Icon(
            //     //         Icons.play_arrow,
            //     //         color: base_color,
            //     //         size: 40,
            //     //       ),
            //     //     ))
            //   ],
            // ),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                videoData['title'],
                style: GoogleFonts.nunito(
                    fontSize: 18, fontWeight: FontWeight.w800),
              ),
              Text(
                videoData['duration'],
                style: GoogleFonts.nunito(
                    fontSize: 18, fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
