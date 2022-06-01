import 'package:flutter/material.dart';

import 'scrollable_category.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Text(
              'Flutter',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            Text(
              'News',
              style: TextStyle(color: Colors.blue, fontSize: 18),
            )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
      body: Container(
          child: Column(
        children: [
          ScrollableCategory(),
        ],
      )),
    );
  }
}
