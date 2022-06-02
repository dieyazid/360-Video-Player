import 'package:flutter/material.dart';
import 'package:myapp/components/topsection.dart';
import 'package:myapp/screens/Signup_screen/form.dart';




class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children:  [
              TopSection(),
              const SignupForm(),
            ],
          ),
        ));
  }
}

