// ignore_for_file: prefer_typing_uninitialized_variables, constant_identifier_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/screens/Welcome_Screen/containers.dart';


const base_color = Color(0xFF2b2e37);
// Color(0xFFd59682);
const second_color = Color(0xFFcfd2db);

var deviceWidth;
var deviceHeight;





class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    deviceHeight = size.height;
    deviceWidth = size.width;
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(children: const <Widget>[
            UpperWelcomeContainer(),
            BottomWelcomeContainer(),
            ]),
        ));
  }
}

class WelcomeImage extends StatelessWidget {
  const WelcomeImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Center(
        child: Text(
          "Welcome!",
          style: GoogleFonts.nunito(
              color: Colors.white, fontSize: 60, fontWeight: FontWeight.w900),
        ),
      ),
      Center(
        child: Image.asset(
          "assets/hello-world.png",
          height: deviceHeight * 0.2,
        ),
      ),
    ]);
  }
}
