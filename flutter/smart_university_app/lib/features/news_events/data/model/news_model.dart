class NewsModel {
  final String title;
  final String content;
  final DateTime createdAt;

  NewsModel({
    required this.title,
    required this.content,
    required this.createdAt,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      title: json['title'],
      content: json['content'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
