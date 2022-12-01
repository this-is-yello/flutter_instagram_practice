import 'package:flutter/material.dart';
import 'package:flutter_insta_prac_1/screens/home_screen.dart';
import 'package:flutter_insta_prac_1/screens/profile_screen.dart';
import 'package:flutter_insta_prac_1/screens/shop_screen.dart';
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
    return Scaffold(
    appBar: AppBar(
          // leading: ,
          title: Text('Instagram'),
          actions: [
            IconButton(onPressed: (() {}), icon: Icon(Icons.add_box_outlined))
          ],
      ),

      body: [HomeScreen(), ShopScreen()][0],
      
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'shop',
          ),
        ],
      )
    );
  }
}