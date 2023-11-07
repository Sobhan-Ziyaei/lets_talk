class EnvironmentTopic {
  int id;
  String name;

  EnvironmentTopic(this.id, this.name);

  factory EnvironmentTopic.fromMapJson(Map<String, dynamic> jsonMapObject) {
    return EnvironmentTopic(
      jsonMapObject['id'],
      jsonMapObject['name'],
    );
  }
}

class EnvironmentRole {
  int id;
  String name;

  EnvironmentRole(this.id, this.name);

  factory EnvironmentRole.fromMapJson(Map<String, dynamic> jsonMapObject) {
    return EnvironmentRole(
      jsonMapObject['id'],
      jsonMapObject['name'],
    );
  }
}

class EnvironmentChat {
  int messageId;
  String messageChat;
  String type ;
  EnvironmentChat({required this.messageId, required this.messageChat,required this.type});

  factory EnvironmentChat.fromMapJson(Map<String, dynamic> jsonMapObject) {
    return EnvironmentChat(
      messageId: jsonMapObject['message_id'] as int,
      messageChat: jsonMapObject['message'] as String,
      type: jsonMapObject['type'] as String ,
    );
  }
}
