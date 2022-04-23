class PostLearnModel1 {
  final int? userId;
  final int? id;
  final String? title;
  String? body;

  PostLearnModel1({this.userId, this.id, this.title, this.body});

  void updateBody(String? data) {
    if (data != null && data.isNotEmpty) {
      body = data;
    }
  }

  PostLearnModel1 copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) {
    return PostLearnModel1(
        userId: userId ?? this.userId, id: id ?? this.id, title: title ?? this.title, body: body ?? this.body);
  }
}
