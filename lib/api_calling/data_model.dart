class User {
  final int id;
  final String title;
  final String body;

  User({required this.id, required this.title, required this.body});

  factory User.fromJson(Map<String, dynamic> data) {
    return User(id: data['id'], title: data['title'], body: data['body']);
  }
}
