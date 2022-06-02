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
  late String url;
  @override
  void initState() {
    url =
        'https://newsapi.org/v2/top-headlines?country=in&category=business&pageSize=80&apiKey=3a6e906bf9a140f4a1d0ef685c20da77';
    getNews();
    super.initState();
  }

  getNews() async {
    news = await News(url_text: url).getNews();
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
              style: TextStyle(fontSize: 21, color: Colors.black),
            ),
            Text(
              'News',
              style: TextStyle(color: Colors.blue, fontSize: 21),
            )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                  child: Column(
                children: [
                  ScrollableCategory(),
                  SizedBox(
                    height: 10,
                  ),
                  Newsfeed(news: news),
                ],
              )),
            ),
    );
  }
}
