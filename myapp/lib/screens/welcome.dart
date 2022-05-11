// ignore_for_file: prefer_typing_uninitialized_variables, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/screens/home.dart';
import 'package:myapp/screens/loginpage.dart';
import 'package:myapp/screens/signuppage.dart';

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
        body: Column(children: <Widget>[
      Container(
        height: size.height - (size.height / 1.5),
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(color: base_color,
            // borderRadius: const BorderRadius.all(Radius.circular(18)),
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                spreadRadius: 10,
                blurRadius: 10,
                offset: Offset(0, 3),
              )
            ]),
        child: SingleChildScrollView(
          child: Column(children: [
            Center(
              child: Text(
                "Welcome!",
                style: GoogleFonts.nunito(
                    color: Colors.white,
                    fontSize: 60,
                    fontWeight: FontWeight.w900),
              ),
            ),
            Center(
              child: Image.asset(
                "assets/hello-world.png",
                height: size.height * 0.2,
              ),
            ),
          ]),
        ),
      ),
      Container(
        height: size.height - (size.height - (size.height / 1.5)),
        padding: const EdgeInsets.all(10),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Center(
                child: Text(
                  "Take your first step!",
                  style: GoogleFonts.nunito(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w900),
                ),
              ),
              Center(
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

                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 70),
                      primary: base_color,
                    ),
                    child: Text(
                      "SIGN UP",
                      style: GoogleFonts.nunito(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: Text(
                  "Already a member",
                  style: GoogleFonts.nunito(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w900),
                ),
              ),
              Center(
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
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 80),
                      primary: base_color,
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
              const SizedBox(height: 30),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(29),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return const HomePage();
                        }),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      // shape: const CircleBorder(),
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 80),
                      primary: base_color,
                    ),
                    child: Text(
                      "HOME TESTING...",
                      style: GoogleFonts.nunito(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      //   SizedBox(height: size.height*0.2,),
    ]));
  }
}
