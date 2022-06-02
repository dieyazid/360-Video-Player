// ignore_for_file: prefer_typing_uninitialized_variables, constant_identifier_names, use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:myapp/screens/Welcome_Screen/containers.dart';

const base_color = Color(0xFF2b2e37);
// Color(0xFFd59682);
const second_color = Color(0xFFcfd2db);

var deviceWidth;
var deviceHeight;


class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    deviceHeight = size.height;
    deviceWidth = size.width;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: const <Widget>[
        UpperWelcomeContainer(),
        BottomWelcomeContainer(),
      ]),
    ));
  }
}

