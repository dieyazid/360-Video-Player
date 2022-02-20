import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/main.dart';
import 'package:myapp/screens/home.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false, 
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            bottom: -90,
            right: -130,
            child: Image.asset(
              "images/splash.png",
              width: size.width * 0.8,
            ),
          ),
          Positioned(
            top: -90,
            left: -130,
            child: Image.asset(
              "images/splash1.png",
              width: size.width * 0.8,
            ),
          ),
          Positioned(
            top: 80,
            left: size.width * 0.001,
            child: Image.asset(
              "images/user.png",
              height: size.height * 0.3,
            ),
          ),
          Positioned(
            top: 30,
            left: size.width / 6,
            child: Column(
              children: <Widget>[
                Text(
                  "Sign Up",
                  style: GoogleFonts.nunito(
                      color: Colors.black,
                      fontSize: 60,
                      fontWeight: FontWeight.w900),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Material(
         
                    borderRadius: BorderRadius.circular(30),
                    child: TextField(
                      style: GoogleFonts.nunito(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                      decoration: const InputDecoration(
                        fillColor: color_lightblue,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 0.0),
                          borderRadius:
                              BorderRadius.all( Radius.circular(30.0)),
                        ),
                        hintText: "USERNAME",
                        prefixIcon: Icon(
                          Icons.person,
                          color: color_blue,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 0.0),
                          borderRadius:  BorderRadius.all(
                               Radius.circular(30.0)),
                        ),
                      ),
                    )),
                const SizedBox(height: 20),
                Material(
                    borderRadius: BorderRadius.circular(30),
                    child: TextField(
                      style: GoogleFonts.nunito(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                      decoration:const InputDecoration(
                        fillColor: color_lightblue,
                        filled: true,
                        prefixIcon: Icon(
                          Icons.mail,
                          color: color_blue,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 0.0),
                          borderRadius:  BorderRadius.all(
                               Radius.circular(30.0)),
                        ),
                        hintText: "EMAIL",
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 0.0),
                          borderRadius:  BorderRadius.all(
                               Radius.circular(30.0)),
                        ),
                      ),
                    )),
                const SizedBox(height: 20),
                Material(
                    borderRadius: BorderRadius.circular(30),
                    child: TextField(
                      style: GoogleFonts.nunito(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                      obscureText: true,
                      decoration:const InputDecoration(
                        fillColor: color_lightblue,
                        filled: true,
                        prefixIcon: Icon(
                          Icons.lock,
                          color: color_blue,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 0.0),
                          borderRadius:  BorderRadius.all(
                               Radius.circular(30.0)),
                        ),
                        hintText: "PASSWORD",
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 0.0),
                          borderRadius:  BorderRadius.all(
                               Radius.circular(30.0)),
                        ),
                      ),
                    )),
                    const SizedBox(height: 20),
                Material(
                    borderRadius: BorderRadius.circular(30),
                    child: TextField(
                      style: GoogleFonts.nunito(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                      obscureText: true,
                      decoration:const InputDecoration(
                        fillColor: color_lightblue,
                        filled: true,
                        prefixIcon: Icon(
                          Icons.lock,
                          color: color_blue,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 0.0),
                          borderRadius:  BorderRadius.all(
                               Radius.circular(30.0)),
                        ),
                        hintText: " CONFIRM PASSWORD",
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 0.0),
                          borderRadius:  BorderRadius.all(
                               Radius.circular(30.0)),
                        ),
                      ),
                    )),
                
              ],
            ),
          ),
         
          Positioned(
            bottom: size.height/8,
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
                        "SIGN UP",
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
    );
  }
  
}
