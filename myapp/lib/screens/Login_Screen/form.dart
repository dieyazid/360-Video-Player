// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/components/buttons.dart';
import 'package:myapp/components/images.dart';
import 'package:myapp/components/textfields.dart';
import 'package:myapp/screens/Welcome_Screen/welcome.dart';
import 'package:myapp/screens/Home_Screen/home.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);
  @override
  LoginForm_ createState() => LoginForm_();
}
class LoginForm_ extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        const LoginImage(),
        Form(
          key: formKey,
          // autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(children: [
            const EmailField(),
            SizedBox(
              height: deviceHeight * 0.02,
            ),
            const PasswordField(),
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
                  MaterialPageRoute(builder: (context) => const HomePage()),
                  (route) => false);
            }
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
    ),
        const ForgetPasswordButton(),
      ]),
    );
  }
}
