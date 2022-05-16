import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/screens/Welcome_Screen/welcome.dart';
import 'package:myapp/screens/Login_Screen/login.dart';
import 'package:myapp/screens/ResetPassword_Screen/forgotpass.dart';
import 'package:myapp/screens/Signup_screen/signuppage.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
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

            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 70),
            primary: base_color,
          ),
          child: Text(
            "SIGN UP",
            style: GoogleFonts.nunito(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800),
          ),
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
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
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 80),
            primary: base_color,
          ),
          child: Text(
            "LOGIN",
            style: GoogleFonts.nunito(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800),
          ),
        ),
      ),
    );
  }
}

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return ForgotPassword();
              }),
            );
          },
          style: ElevatedButton.styleFrom(
              // shape: const CircleBorder(),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 80),
              primary: Colors.white),
          child: const Text.rich(TextSpan(
            text: "Forgot Password?",
            style: TextStyle(
                decoration: TextDecoration.underline,
                fontFamily: "GoogleFonts.nunito",
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black),
          )),
        ),
      ),
    );
  }
}
