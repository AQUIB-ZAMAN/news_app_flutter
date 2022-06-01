import 'package:flutter/material.dart';
import 'package:news/views/widgets/blog_tile.dart';

import '../helper/article.dart';

class Newsfeed extends StatelessWidget {
  final List<Article> news;

  Newsfeed({
    required this.news,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        // width: double.infinity,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: news.length,
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return BlogTile(
              imageUrl: news[index].imageUrl,
              title: news[index].title,
              desc: news[index].desc,
            );
          },
        ),
      ),
    );
  }
}
