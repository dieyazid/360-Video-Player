// ignore_for_file: unnecessary_new, prefer_typing_uninitialized_variables, non_constant_identifier_names, camel_case_types, sized_box_for_whitespace

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/components/drawer.dart';
import 'package:myapp/screens/Home_Screen/videocards.dart';
import 'package:myapp/screens/Welcome_Screen/welcome.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  HomePage_ createState() => HomePage_();
}

class HomePage_ extends State<HomePage> {
  List Videos = [];
  var Responsehttp;
  var ResponseCode;
  String url = "http://192.168.1.12:3000/videos";
  getData() async {
    try {
      Responsehttp = await http.get(Uri.parse(url));
    } catch (e) {
      ResponseCode = null;
    }
    var jsonData = jsonDecode(Responsehttp.body);
    Videos.clear();
    for (var u in jsonData) {
      Videos.add({
        'title': u['title'],
        'thumbnail': u['thumbnail'],
        'duration': u['duration']
      });
    }
    ResponseCode = Responsehttp.statusCode;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await getData();
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
          actions: [
            ElevatedButton(
              key: const Key("refresh_button"),
              onPressed: () {
                getData();
              },
              child: const Icon(
                Icons.refresh,
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
      body: SingleChildScrollView(child: Builder(builder: (context) {
        // print(Responsehttp);
        switch (ResponseCode) {
          case 200:
            if (Videos.isNotEmpty) {
              return VideoCardsGen();
            }
            return NoVideosAvailable();
          default:
            return ConnectionError();
        }
      })),
    );
  }

  Container ConnectionError() {
    return Container(
      height: deviceHeight,
      child: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: deviceHeight / 3,
          ),
          Center(
            child: Text(
              "Could not connect to the server please refresh",
              textAlign: TextAlign.center,
              style: GoogleFonts.nunito(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w900),
            ),
          ),
          const SizedBox(
            // height: deviceHeight - (deviceHeight / 12 + 15),
            child: Center(
                child: SpinKitDoubleBounce(
              size: 140,
              color: Colors.black,
            )),
          ),
        ]),
      ),
    );
  }

  Container NoVideosAvailable() {
    return Container(
      height: deviceHeight,
      child: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: deviceHeight / 3,
          ),
          Center(
            child: Text(
              "There are no videos available right now",
              textAlign: TextAlign.center,
              style: GoogleFonts.nunito(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w900),
            ),
          ),
          const SizedBox(
            // height: deviceHeight - (deviceHeight / 12 + 15),
            child: Center(
                child: SpinKitCircle(
              size: 100,
              color: Colors.black,
            )),
          ),
        ]),
      ),
    );
  }

  Column VideoCardsGen() {
    return Column(mainAxisSize: MainAxisSize.min, children: [
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
    ]);
  }
}

class Video {
  final String name, email, username;

  Video(this.name, this.email, this.username);
}
