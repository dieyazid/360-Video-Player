// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/components/topsection.dart';
import 'package:myapp/screens/Welcome_Screen/welcome.dart';


class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
            // alignment: Alignment.center,
            children: [
              const TopSection(),
              Center(
                child: Text(
                  "Coming Soon...",
                  style: GoogleFonts.nunito(
                      color: Colors.black,
                      fontSize: 60,
                      fontWeight: FontWeight.w900),
                ),
              ),
              Center(
                  child: Image.asset(
                "assets/forgotpassword.png",
                height: deviceHeight * 0.3,
              )),
            ]),
      ),
    );
  }
}
