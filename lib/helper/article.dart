class Article {
  String author = '',
      title = '',
      desc = '',
      content = '',
      url = '',
      imageUrl = '';
  DateTime? publishedAt;
  Article({
    required this.author,
    required this.title,
    required this.desc,
    required this.content,
    required this.url,
    required this.imageUrl,
    this.publishedAt,
  });
}
