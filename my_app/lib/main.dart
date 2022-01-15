import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Panorama',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Panorama(
        child: Image.network(
            'https://images.pexels.com/photos/207385/pexels-photo-207385.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),
      ),
    );
  }
}