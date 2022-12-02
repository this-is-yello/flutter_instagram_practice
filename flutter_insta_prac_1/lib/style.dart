import 'package:flutter/material.dart';

var theme = ThemeData(
  appBarTheme: AppBarTheme(
    color: Colors.white,
    titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
    // actionsIconTheme: IconThemeData(color: Colors.black, size: 30),
    iconTheme: IconThemeData(color: Colors.black, size: 30)
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: Colors.black,
    unselectedItemColor: Colors.black,
  )
);