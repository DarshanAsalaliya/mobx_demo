class Comment {
  final int id;
  final int postId;
  final String body;
  final String name;
  final String email;

  Comment({
    required this.id,
    required this.postId,
    required this.body,
    required this.name,
    required this.email
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
        id: json['id'],
        postId: json['postId'],
        body: json['body'],
        name: json['name'],
        email: json['email']);
  }
}