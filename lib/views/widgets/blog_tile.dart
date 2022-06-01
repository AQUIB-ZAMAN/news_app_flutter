import 'package:flutter/material.dart';

class BlogTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String desc;

  BlogTile({
    required this.imageUrl,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          Image.network(
            imageUrl,
          ),
          Text(title),
          Text(desc),
        ],
      ),
    );
  }
}
