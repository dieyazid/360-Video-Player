import 'package:flutter/material.dart';
import 'package:myapp/screens/activation.dart';
import 'package:myapp/components/forms.dart';


class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              TopSection(),
              SignupForm(),
            ],
          ),
        ));
  }
}
