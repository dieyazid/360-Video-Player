import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/main.dart';
import 'package:myapp/screens/home.dart';
import 'package:myapp/screens/welcome.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) =>const WelcomePage())));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
      alignment: Alignment.center,
      children: <Widget>[

      Positioned(
        bottom: -90,
        right: -130,
        child: Image.asset(
          "images/splash.png",
          width: size.width ,
        ),
      ),
      Positioned(
        top: -90,
        left: -130,
        child: Image.asset(
          "images/splash1.png",
          width: size.width ,
        ),
      ),
      Positioned(
        top: size.height/1.9,
        left: size.width/5,
        child: Image.asset("images/Space.png",height: size.height*0.7,),
        ),
      Positioned(
        top: 180,
        left: size.width / 6,
        child: Column(
          children: <Widget>[
            Text(
              "360°",
              style: GoogleFonts.nunito(
                  color: Colors.white,
                  fontSize: 60,
                  fontWeight: FontWeight.w900),
            ),
          ],
        ),
      ),

      ]
    ));
  }
}
