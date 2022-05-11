import 'package:flutter/material.dart';
import 'package:myapp/components/forms.dart';
import 'package:myapp/components/topsection.dart';

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
