import 'package:flutter/material.dart';
import 'package:myapp/main.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SearchSection(),
              VideoSection(),
            ],
          ),
        ),
      );
}


