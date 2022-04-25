import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/main.dart';
import 'package:myapp/screens/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  LoginPage_ createState() => LoginPage_();
}

class LoginPage_ extends State<LoginPage> {
  final textfieldfocus = FocusNode();
  bool obscure_ = true;
  void toggleObscured() {
    setState(() {
      obscure_ = !obscure_;
      if (textfieldfocus.hasPrimaryFocus) return;
      textfieldfocus.canRequestFocus = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
          // alignment: Alignment.center,
          children: [
            Stack(children: [
              Positioned(
                top: (size.height - size.height * 1.1),
                left: (size.width - size.width * 1.1),
                child: Image.asset(
                  "images/splash1.png",
                  width: size.width * 0.3,
                ),
              ),
              Positioned(
                top: (size.height - size.height * 0.2),
                left: (size.width - size.width * 0.2),
                child: Image.asset(
                  "images/splash1.png",
                  width: size.width * 0.3,
                ),
              ),
            ]),
            Column(
              children: [
                SizedBox(
                  height: size.height * 0.03,
                ),
                Center(
                    child: Image.asset(
                  "images/login.png",
                  height: size.height * 0.3,
                )),
                Center(
                  child: Text(
                    "Login",
                    style: GoogleFonts.nunito(
                        color: Colors.black,
                        fontSize: 60,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Center(
                    child: SizedBox(
                  width: size.width * 0.7,
                  child: TextField(
                    style: GoogleFonts.nunito(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior
                          .never, //Hides label on focus or if filled
                      labelText: "Email",
                      filled: true, // Needed for adding a fill color
                      fillColor: color_lightblue,
                      isDense: true, // Reduces height a bit
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none, // No border
                        borderRadius:
                            BorderRadius.circular(20), // Apply corner radius
                      ),
                      prefixIcon: const Icon(
                        Icons.mail,
                        size: 24,
                        color: color_blue,
                      ),
                      suffixIcon: const Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 4, 0),
                      ),
                    ),
                  ),
                )),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Center(
                    child: SizedBox(
                  width: size.width * 0.7,
                  child: TextField(
                    style: GoogleFonts.nunito(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: obscure_,
                    // focusNode: textfieldfocus,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior
                          .never, //Hides label on focus or if filled
                      labelText: "Password",
                      filled: true, // Needed for adding a fill color
                      fillColor: color_lightblue,
                      isDense: true, // Reduces height a bit
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none, // No border
                        borderRadius:
                            BorderRadius.circular(20), // Apply corner radius
                      ),
                      prefixIcon: const Icon(
                        Icons.lock_rounded,
                        size: 24,
                        color: color_blue,
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                        child: GestureDetector(
                          onTap: toggleObscured,
                          child: Icon(
                            obscure_
                                ? Icons.visibility_rounded
                                : Icons.visibility_off_rounded,
                            color: color_blue,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                )),
                SizedBox(
                  height: size.height * 0.03,
                ),
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
              ],
            ),
          ]),
    );
  }
}
