// ignore_for_file: unnecessary_new

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/main.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/screens/welcome.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  HomePage_ createState() => HomePage_();
}

class HomePage_ extends State<HomePage> {
  List Videos = [
    // {'title': 'Title', 'picture': 'assets/default.png', 'duration': 'xx:xx'},
    // {'title': 'Title', 'picture': 'assets/default.png', 'duration': 'xx:xx'},
    // {'title': 'Title', 'picture': 'assets/default.png', 'duration': 'xx:xx'},
    // {'title': 'Title', 'picture': 'assets/default.png', 'duration': 'xx:xx'},
  ];
  getData() async {
    const String url = "http://192.168.1.12:3000/users";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    final length = jsonData.length;
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(backgroundColor: base_color),
      drawer: Drawer(
        child: ListView(
          // Important Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: second_color,
              ),
              child: Column(children: const [
                Text(
                  'Menu',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ]),
            ),
            SizedBox(
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return const HomePage();
                    }),
                  );
                },
                child: Row(children: const [
                  Icon(
                    Icons.settings,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Refresh List',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ]),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return const WelcomePage();
                    }),
                  );
                },
                child: Row(children: const [
                  Icon(
                    Icons.logout,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ]),
                style: ElevatedButton.styleFrom(primary: Colors.white),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
              height: size.height - (size.height / 12 + 15),
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
        Container(
          height: 150,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: NetworkImage(videoData['thumbnail']),
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
