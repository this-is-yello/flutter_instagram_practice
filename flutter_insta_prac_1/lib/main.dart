import 'package:flutter/material.dart';
import 'package:flutter_insta_prac_1/screens/home_screen.dart';
import 'package:flutter_insta_prac_1/style.dart' as style;



void main() {
  runApp(MaterialApp(
    theme: style.theme,
    home: MyApp()
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}