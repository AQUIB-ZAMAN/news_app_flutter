import 'dart:convert';

import 'article.dart';
import 'package:http/http.dart' as http;

class News {
  List<Article> news = [];
  final String url_text;
  News({
    required this.url_text,
  });
  Future<List<Article>> getNews() async {
    var url = Uri.parse(url_text);

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          Article article = Article(
            author: element['author'],
            title: element['title'],
            desc: element['description'],
            content: element['content'],
            url: element['url'],
            imageUrl: element['urlToImage'],
            publishedAt: element['publishedAt'],
          );
          news.add(article);
        }
      });
    }
    return news;
  }
}
