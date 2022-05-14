import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/components/topsection.dart';
import 'package:myapp/screens/forgotpass.dart';
import 'package:myapp/screens/home.dart';
import 'package:myapp/screens/welcome.dart';
class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);
  @override
  LoginForm_ createState() => LoginForm_();
}

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: const [TopSection(), LoginForm()],
      )),
    );
  }
}
class LoginForm_ extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();
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
    return SingleChildScrollView(
      child: Column(children: [
        const LoginImage(),
        Form(
          key: formKey,
          // autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(children: [
            Center(
                child: SizedBox(
              width: deviceWidth * 0.7,
              child: TextFormField(
                validator: (email) =>
                    email != null && !EmailValidator.validate(email)
                        ? 'Invalid Email'
                        : null,
                style: GoogleFonts.nunito(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior
                      .never, //Hides label on focus or if filled
                  labelText: "Email",
                  filled: true, // Needed for adding a fill color
                  fillColor: second_color,
                  isDense: true, // Reduces height a bit
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none, // No border
                    borderRadius:
                        BorderRadius.circular(20), // Apply corner radius
                  ),
                  prefixIcon: const Icon(
                    Icons.mail,
                    size: 24,
                    color: base_color,
                  ),
                  suffixIcon: const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 4, 0),
                  ),
                ),
              ),
            )),
            SizedBox(
              height: deviceHeight * 0.02,
            ),
            Center(
                child: SizedBox(
              width: deviceWidth * 0.7,
              child: TextFormField(
                validator: (password) {
                  if (password!.length < 8) {
                    return 'Invalid Password';
                  } else {
                    return null;
                  }
                },
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
                  fillColor: second_color,
                  isDense: true, // Reduces height a bit
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none, // No border
                    borderRadius:
                        BorderRadius.circular(20), // Apply corner radius
                  ),
                  prefixIcon: const Icon(
                    Icons.lock_rounded,
                    size: 24,
                    color: base_color,
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                    child: GestureDetector(
                      onTap: toggleObscured,
                      child: Icon(
                        obscure_
                            ? Icons.visibility_rounded
                            : Icons.visibility_off_rounded,
                        color: base_color,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ),
            )),
          ]),
        ),
        SizedBox(
          height: deviceHeight * 0.02,
        ),
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(29),
            child: ElevatedButton(
              onPressed: () {
                // ignore: non_constant_identifier_names
                final FormisValid = formKey.currentState!.validate();
                if (FormisValid) {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => HomePage()),
                      (route) => false);
                }
              },
              style: ElevatedButton.styleFrom(
                // shape: const CircleBorder(),
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 80),
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
        Center(
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 80),
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
        ),
      ]),
    );
  }
}

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