// ignore_for_file: unnecessary_new

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/main.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/screens/welcome.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      resizeToAvoidBottomInset: false,
      body: 
      // DataFromApi()
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 15),
          const SearchSection(),
          VideoSection(),

        ],
      ),
      );
}

class SearchSection extends StatelessWidget {
  const SearchSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 12,
      color: Colors.transparent,
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  )
                ],
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                )),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return const WelcomePage();
                      }),
                    );
              },
              child: const Icon(
                Icons.logout,
                size: 26,
              ),
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(10),
                primary: Colors.redAccent,
              ),
            ),
          ),
          const SizedBox(width: 10,),
          Center(
        child: Text(
          "Logout!",
          style: GoogleFonts.nunito(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.w900),
        ),
      ),
          // Expanded(
          //     child: Container(
          //   padding: const EdgeInsets.only(left: 5),
          //   decoration: BoxDecoration(
          //       color: Colors.white,
          //       borderRadius: BorderRadius.circular(30),
          //       // ignore: prefer_const_literals_to_create_immutables
          //       boxShadow: [
          //         const BoxShadow(
          //           color: base_color,
          //           blurRadius: 5,
          //           offset: Offset(0, 2),
          //         )
          //       ]),
          //   child: TextField(
          //     style:GoogleFonts.nunito(
          //             color: Colors.black,
          //             fontSize: 15,
          //             fontWeight: FontWeight.w600),
          //     showCursor: false,
          //     decoration: const InputDecoration(
          //       hintText: 'Video title',
          //       contentPadding: EdgeInsets.all(14),
          //       border: InputBorder.none,
          //     ),
          //   ),
          // )),
          // const SizedBox(
          //   width: 10,
          // ),
          // Container(
          //   height: 50,
          //   width: 50,
          //   decoration: const BoxDecoration(
          //       boxShadow: [
          //         BoxShadow(
          //           color: Colors.grey,
          //           blurRadius: 4,
          //           offset: Offset(0, 4),
          //         )
          //       ],
          //       borderRadius: BorderRadius.all(
          //         Radius.circular(25),
          //       )),
          //   child: ElevatedButton(
          //     onPressed: () {},
          //     child: const Icon(
          //       Icons.search,
          //       size: 26,
          //     ),
          //     style: ElevatedButton.styleFrom(
          //       shape: const CircleBorder(),
          //       padding: const EdgeInsets.all(10),
          //       primary: base_color,
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}

class VideoSection extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final List Videos = [
    {'title': 'Title', 'picture': 'assets/default.png', 'duration': 'xx:xx'},
    {'title': 'Title', 'picture': 'assets/default.png', 'duration': 'xx:xx'},
    {'title': 'Title', 'picture': 'assets/default.png', 'duration': 'xx:xx'},
  ];

  VideoSection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height - (size.height / 12 + 15),
        padding: const EdgeInsets.all(10),
        color: const Color(0xFFeaaea),
        child: SingleChildScrollView(
          child: Column(
            children: Videos.map((video) {
              return VideoCard(video);
            }).toList(),
          ),
        ));
  }
}

class Video {
  final String title, duration, thumbnail;

  Video(this.title, this.duration, this.thumbnail);
}

// ignore: use_key_in_widget_constructors
class DataFromApi extends StatefulWidget {
  @override
  _DataFromApiState createState() => _DataFromApiState();
}

class _DataFromApiState extends State<DataFromApi> {
  Future getData() async {
    const String url = "http://192.168.1.12:3000/video";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    final length = jsonData.length;
    print(length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DATA'),
      ),
      body: Center(
          child: ElevatedButton(
        child: const Text('CLICK'),
        onPressed: () {
          getData();
        },
      )),
    );
  }
}

class VideoCard extends StatelessWidget {
  final Map videoData;
  // ignore: use_key_in_widget_constructors
  const VideoCard(this.videoData);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
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
        Container(
          height: 140,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(videoData['picture']),
            fit: BoxFit.cover,
          )),
          child: Stack(
            children: [
              Positioned(
                  top: 5,
                  right: -15,
                  child: MaterialButton(
                    color: Colors.white,
                    shape: const CircleBorder(),
                    onPressed: () {},
                    child: const Icon(
                      Icons.play_arrow,
                      color: base_color,
                      size: 20,
                    ),
                  ))
            ],
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
