import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var data = [];

  getData() async {
    var result1 = await http
        .get(Uri.parse('https://codingapple1.github.io/app/data.json'));
    var result2 = jsonDecode(result1.body);
    setState(() {
      data = result2;
    });
    print(data);
  }

  var scroll = ScrollController();
  bool scrollEnd = true;

  moreData() async {
    var result3 = await http
        .get(Uri.parse('https://codingapple1.github.io/app/more1.json'));
    var result4 = jsonDecode(result3.body);
    print(result4);
    addData(result4);
  }

  addData(a) {
    setState(() {
      data.add(a);
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
    scroll.addListener(() {
      print('scroll~');
      if (scroll.position.pixels == scroll.position.maxScrollExtent &&
          scrollEnd == true) {
        scrollEnd = false;
        print('bottom');
        moreData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (data.isNotEmpty) {
      return Scaffold(
          appBar: AppBar(
            // leading: ,
            title: Text('Instagram'),
            actions: [
              IconButton(onPressed: (() {}), icon: Icon(Icons.add_box_outlined))
            ],
          ),
          body: ListView.builder(
            controller: scroll,
            itemCount: data.length,
            itemBuilder: ((context, i) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    constraints: BoxConstraints(maxWidth: 500),
                    child: Image.network(data[i]['image']),
                  ),
                  Container(
                    constraints: BoxConstraints(maxWidth: 500),
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('좋아요' + ' ' + data[i]['likes'].toString() + '개'),
                        Padding(padding: EdgeInsets.only(bottom: 4)),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            child: Text(data[i]['user'],
                                style: TextStyle(fontWeight: FontWeight.w800)),
                            onTap: () {},
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 4)),
                        Text(data[i]['content'])
                      ],
                    ),
                  ),
                ],
              );
            }),
          ),
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
          ));
    } else {
      return Center(
        child: CircularProgressIndicator(
          color: Colors.black,
        ),
      );
    }
  }
}
