import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../category_news.dart';

class CategoryTile extends StatelessWidget {
  final String imageUrl;
  final String text;

  CategoryTile({
    required this.imageUrl,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CategoryNews(
                  newsCategory: text.toLowerCase(),
                )));
      },
      child: Container(
          margin: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.black,
                width: 1,
                style: BorderStyle.solid,
              )),
          height: 70,
          width: 120,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  width: 120,
                  height: 70,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black38,
                ),
                width: 120,
                height: 70,
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ],
          )),
    );
  }
}
