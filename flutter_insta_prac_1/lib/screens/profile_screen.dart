import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, this.data});

  final data;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  var postImg = [];

  getImg() async {
    var result1 = await http.get(Uri.parse('https://codingapple1.github.io/app/profile.json'));
    var result2 = jsonDecode(result1.body);
    setState(() {
      postImg = result2;
    });
    print(postImg);
  }

  @override
  void initState() {
    super.initState();
    getImg();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: ,
        title: Center(child: Text(widget.data['user'])),
        // actions: [],
      ),

      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: ProfileTop(),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (c, i) => Container(
                child: Image.network(postImg[i]),
                // color: Colors.black,
                margin: EdgeInsets.all(4),
              ),
              childCount: postImg.length,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          ),
        ],
      ),
    );
  }
}

class ProfileTop extends StatefulWidget {
  const ProfileTop({super.key});

  @override
  State<ProfileTop> createState() => _ProfileTopState();
}

class _ProfileTopState extends State<ProfileTop> {

  bool following = true;

  var flw =50;
  var flwBtn = '팔로우';

  changeBtn() {
    if(following == false) {
      setState(() {
        flw--;
        flwBtn = '팔로우';
      });
      following = true;
    } else {
      setState(() {
        flw++;
        flwBtn = '언팔로우';
      });
      following = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 500),
      height: 80,
      // margin: EdgeInsets.all(10),
      child: Center(
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('img/bykak.jpg'),
          ),

          title: Text('팔로워' + ' ' + '${flw}'.toString() + '명'),

          trailing: ElevatedButton(
            child: Text(flwBtn),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            onPressed: () {
              changeBtn();
            },
          ),
        ),
      ),
    );
  }
}