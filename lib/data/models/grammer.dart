class GrammerTopics {
  final Map<String, String> topics;

  GrammerTopics(this.topics);

  factory GrammerTopics.fromJson(Map<String, dynamic> json) {
    final topics = Map<String, String>.from(json);
    return GrammerTopics(topics);
  }
}

class GrammerContent {
  String content;

  GrammerContent(
    this.content,
  );

  factory GrammerContent.fromMapJson(Map<String, dynamic> jsonMapObject) {
    return GrammerContent(
      jsonMapObject['content']!,
    );
  }
}
