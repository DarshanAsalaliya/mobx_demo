class Post {
  final int id;
  final int userId;
  final String body;
  final String title;

  Post({
    required this.id,
    required this.userId,
    required this.body,
    required this.title,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        id: json['id'],
        userId: json['userId'],
        body: json['body'],
        title: json['title']);
  }
}