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
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: size.height*0.2,),
        Center(
          child: Text(
          "Welcome",
          style: GoogleFonts.nunito(
              color:Colors.black ,
              fontSize: 60,
              fontWeight: FontWeight.w900),
        ),),
        const SizedBox(height: 30),
        Center(
          child: Text(
          "Take your first step!",
          style: GoogleFonts.nunito(
              color:color_blue ,
              fontSize: 30,
              fontWeight: FontWeight.w900),
        ),),
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
                
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 70),
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
        const SizedBox(height: 30),
        Center(
          child: Text(
          "Already a member login?",
          style: GoogleFonts.nunito(
              color:Colors.black ,
              fontSize: 30,
              fontWeight: FontWeight.w900),
        ),),
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
        
        
      ]));
  }
}
