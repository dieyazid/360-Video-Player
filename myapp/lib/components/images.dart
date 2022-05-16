import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/screens/Welcome_Screen/welcome.dart';

class LoginImage extends StatelessWidget {
  const LoginImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Stack(children: [
            Center(
                child: Image.asset(
              "assets/login.png",
              height: deviceHeight * 0.3,
            )),
          ]),
        ),
        Center(
          child: Text(
            "Login",
            style: GoogleFonts.nunito(
                color: Colors.black, fontSize: 60, fontWeight: FontWeight.w900),
          ),
        ),
      ],
    );
  }
}