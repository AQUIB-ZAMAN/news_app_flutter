import 'package:flutter/material.dart';
import 'package:news/views/news_feed.dart';

import '../helper/article.dart';
import '../helper/news_data.dart';
import 'scrollable_category.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Article> news = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    getNews();
  }

  getNews() async {
    news = await News(
            url_text:
                'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=3a6e906bf9a140f4a1d0ef685c20da77')
        .getNews();
    setState(() {
      loading = false;
    });
  }

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
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              child: Column(
              children: [
                ScrollableCategory(),
                SizedBox(
                  height: 5,
                ),
                Newsfeed(news: news),
              ],
            )),
    );
  }
}
