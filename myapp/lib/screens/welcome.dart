import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/main.dart';
import 'package:myapp/screens/login.dart';
import 'package:myapp/screens/signup.dart';
class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(body: SizedBox(
      height: size.height,
      width: size.width,
      child: Stack(children: <Widget>[
        ///Images///////

        Positioned(
          top: -550,
          left: -600,
          child: Image.asset(
            "images/delete.png",
            width: size.width * 3,
          ),
        ),
        Positioned(
          bottom: -90,
          right: -130,
          child: Image.asset(
            "images/planet.png",
            width: size.width * 0.8,
          ),
        ),
        Positioned(
          top: 50,
          right: -130,
          child: Image.asset(
            "images/splash.png",
            width: size.width * 0.8,
          ),
        ),
        Positioned(
          bottom: -90,
          left: -130,
          child: Image.asset(
            "images/splash.png",
            width: size.width * 0.8,
          ),
        ),

        ///Text////////

        Positioned(
          top: 180,
          left: size.width / 25,
          child: Column(
            children: <Widget>[
              Text(
                "Welcome to",
                style: GoogleFonts.nunito(
                    color: Colors.black,
                    fontSize: 60,
                    fontWeight: FontWeight.w900),
              ),
              Text(
                "360VP",
                style: GoogleFonts.nunito(
                    color: color_blue,
                    fontSize: 48,
                    fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ),

        ////////Buttons///////////////

        Positioned(
          top: size.height / 2,
          left: size.width / 4,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(29),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const LoginPage();
                  }),
                );
              },
              style: ElevatedButton.styleFrom(
                // shape: const CircleBorder(),
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 80),
                primary: color_blue,
              ),
              child: Text(
                "LOGIN",
                style: GoogleFonts.nunito(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w800),
              ),
            ),
          ),
        ),
        Positioned(
          top: size.height / 2 + 80,
          left: size.width / 4,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(29),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const SignUpPage();
                  }),
                );
              },
              style: ElevatedButton.styleFrom(
                // shape: const CircleBorder(),
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 70),
                primary: color_lightblue,
              ),
              child: Text(
                "SIGN UP",
                style: GoogleFonts.nunito(
                    color: color_blue,
                    fontSize: 20,
                    fontWeight: FontWeight.w800),
              ),
            ),
          ),
        )
      ]),
    ));
  }
}
