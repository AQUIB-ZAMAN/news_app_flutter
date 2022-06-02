import 'package:flutter/material.dart';
import 'package:news/views/scrollable_category.dart';

import '../helper/news_data.dart';
import 'news_feed.dart';

class CategoryNews extends StatefulWidget {
  final String newsCategory;
  CategoryNews({required this.newsCategory});
  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  var newslist;
  var url;
  bool _loading = true;

  void initState() {
    getNews();
    // TODO: implement initState
    super.initState();
  }

  void getNews() async {
    url = 'https://newsapi.org/v2/top-headlines?country=in&category=' +
        widget.newsCategory +
        '&pageSize=80&apiKey=3a6e906bf9a140f4a1d0ef685c20da77';
    newslist = await News(url_text: url).getNews();

    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        actions: <Widget>[
          Opacity(
            opacity: 0,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(
                  Icons.share,
                )),
          )
        ],
        backgroundColor: Colors.black,
        elevation: 0,
        title: Row(
          children: [
            Text(
              'Flutter',
              style: TextStyle(fontSize: 21, color: Colors.white),
            ),
            Text(
              'News',
              style: TextStyle(color: Colors.blue, fontSize: 21),
            )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
      body: _loading
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
                  Newsfeed(news: newslist),
                ],
              )),
            ),
    );
  }
}
