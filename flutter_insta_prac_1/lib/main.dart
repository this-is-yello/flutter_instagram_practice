import 'package:flutter/material.dart';
import 'package:flutter_insta_prac_1/screens/home_screen.dart';
import 'package:flutter_insta_prac_1/screens/profile_screen.dart';
import 'package:flutter_insta_prac_1/screens/shop_screen.dart';
import 'package:flutter_insta_prac_1/screens/shop_screen.dart';
import 'package:flutter_insta_prac_1/screens/upload_screen.dart';
import 'package:flutter_insta_prac_1/style.dart' as style;



void main() {
  runApp(MaterialApp(
    theme: style.theme,
    home: MyApp()
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          // leading: ,
          title: Text('Instagram'),
          actions: [
            IconButton(
              onPressed: (() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (c) {return UploadScreen();})
                );
              }),
              icon: Icon(Icons.add_box_outlined)
            )
          ],
        ),

        body: TabBarView(
          children: [
            Center(
              child: HomeScreen(),
            ),
            Center(
              child: ShopScreen(),
            )
          ],
        ),
      
        bottomNavigationBar: Container(
          height: 56,
          color: Colors.white,
          child: const TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(
                icon: Icon(Icons.home_outlined),
                text: 'home',
              ),
              Tab(
                icon: Icon(Icons.shopping_bag_outlined),
                text: 'shop',
              ),
            ],
          ),
        ),
      ),
    );
  }
}