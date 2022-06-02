import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/screens/Welcome_Screen/welcome.dart';

class Images extends StatelessWidget {
  Images({required this.imagename});
  String imagename;

  @override
  Widget build(BuildContext context) {
    switch (imagename) {
      case "login":
        return Center(
          child: Stack(children: [
            Center(
                child: Image.asset(
              "assets/login.png",
              height: deviceHeight * 0.3,
            )),
          ]),
        );
      case "welcome":
        return Center(
          child: Image.asset(
            "assets/hello-world.png",
            height: deviceHeight * 0.2,
          ),
        );
      case "signup":
        return Center(
          child: Image.asset(
            "assets/signup.png",
            height: deviceHeight * 0.3,
            width: deviceWidth / 1.5,
          ),
        );
      case "forgotpassword":
        return Center(
            child: Image.asset(
          "assets/forgotpassword.png",
          height: deviceHeight * 0.3,
        ));
      case "activation":
        return Center(
          child: Image.asset(
            "assets/mailsent.png",
            height: deviceHeight * 0.3,
          ),
        );
      default:
        return Container();
    }
  }
}
