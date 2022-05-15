// ignore_for_file: unnecessary_new, prefer_typing_uninitialized_variables, non_constant_identifier_names, camel_case_types, sized_box_for_whitespace

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/components/drawer.dart';
import 'package:myapp/redux/appstate.dart';
import 'package:myapp/screens/player.dart';
import 'package:myapp/screens/welcome.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  HomePage_ createState() => HomePage_();
}

class HomePage_ extends State<HomePage> {
  List Videos = [];
  var Responsehttp;
  var ResponseCode;
  String url = "http://localhost:3000/videos";
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
      body: SingleChildScrollView(
        child: StoreConnector<AppState, AppState>(
            converter: (store) => store.state,
            builder: (context, state) {
              return Builder(builder: (context) {
                // print(Responsehttp);
                switch (ResponseCode) {
                  case 200:
                    if (Videos.isNotEmpty) {
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
                    }return Container(
                      height: deviceHeight,
                      child: SingleChildScrollView(
                        child: Column(children: [
                          SizedBox(
                            height: deviceHeight * 0.5,
                          ),
                          Center(
                            child: Text(
                              "There are no videos available right now",
                              style: GoogleFonts.nunito(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                          // const SizedBox(
                          //   // height: deviceHeight - (deviceHeight / 12 + 15),
                          //   child: Center(
                          //     child: CircularProgressIndicator(),
                          //   ),
                          // ),
                        ]),
                      ),
                    );
                  default:
                    return Container(
                      height: deviceHeight,
                      child: SingleChildScrollView(
                        child: Column(children: [
                          SizedBox(
                            //
                            height: deviceHeight * 0.5,
                          ),
                          Center(
                            child: Text(
                              "We lost connection to the server",
                              style: GoogleFonts.nunito(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                          const SizedBox(
                            // height: deviceHeight - (deviceHeight / 12 + 15),
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        ]),
                      ),
                    );
                }
              });
            }),
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
        height: 280,
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
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PlayerPage(),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(videoData['thumbnail']),
                    fit: BoxFit.cover,
                  )),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 20,
                      width: 50,
                      color: Colors.black,
                      child: Center(
                        child: Text(
                          videoData['duration'],
                          style: GoogleFonts.nunito(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Text(
              videoData['title'],
              style:
                  GoogleFonts.nunito(fontSize: 18, fontWeight: FontWeight.w800),
            ),
          ),
        ]));
  }
}
