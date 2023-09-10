class Todo {
  final int id;
  final int userId;
  bool completed;
  final String title;

  Todo({
    required this.id,
    required this.userId,
    required this.completed,
    required this.title,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
        id: json['id'],
        userId: json['userId'],
        completed: json['completed'],
        title: json['title']);
  }
}
