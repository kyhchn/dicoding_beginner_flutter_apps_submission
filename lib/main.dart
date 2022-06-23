import 'package:flutter/material.dart';
import 'package:submission_dicoding/color_converter.dart';
import 'package:submission_dicoding/views/loginpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Beginner Flutter App Dicoding',
      theme: ThemeData(
        fontFamily: 'OpenSans',
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.white
      ),
      home: LoginPage(),
    );
  }
}

