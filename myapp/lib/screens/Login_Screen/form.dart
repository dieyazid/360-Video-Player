// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:myapp/components/buttons.dart';
import 'package:myapp/components/images.dart';
import 'package:myapp/components/textfields.dart';
import 'package:myapp/screens/ResetPassword_Screen/forgotpass.dart';
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
        FormButton(
          buttontext: 'Login',
          nextpage: const HomePage(),
          formKey: formKey,
          sourcepage: "loginpage",
        ),
        Button(
          buttontext: 'Forgot Password?',
          nextpage: ForgotPassword(),
          text_color: base_color,
          button_color: Colors.white,
        ),
      ]),
    );
  }
}
