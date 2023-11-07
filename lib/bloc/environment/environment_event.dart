abstract class EnvironmentEvent {}

class EnvironmentTopicEvent extends EnvironmentEvent {
  int id;
  EnvironmentTopicEvent({required this.id});
}

class EnvironmentRoleEvent extends EnvironmentEvent {
  int id;
  EnvironmentRoleEvent({required this.id});
}

class EnvironmentChatEvent extends EnvironmentEvent {
  int roleIdUser;
  int roleIdAi;
  EnvironmentChatEvent({required this.roleIdUser, required this.roleIdAi});
}

