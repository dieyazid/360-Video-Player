import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/screens/welcome.dart';
import 'package:myapp/screens/welcome.dart';


class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
          // alignment: Alignment.center,
          children: [
            Row(
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
                      Icons.arrow_back,
                      size: 26,
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(10),
                      primary: base_color,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
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
    );
  }
}
