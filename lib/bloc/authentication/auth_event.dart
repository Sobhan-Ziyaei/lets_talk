abstract class AuthEvent {}

class AuthLoginEvent extends AuthEvent {
  String phone;
  String password;
  String timezone;
  String mac;

  AuthLoginEvent({
    required this.phone,
    required this.password,
    required this.timezone,
    required this.mac,
  });
}

class AuthRegisterEvent extends AuthEvent {
  String username;
  String phone;
  String password;
  String nationality;
  String gender;
  String timezone;
  String mac;

  AuthRegisterEvent({
    required this.username,
    required this.phone,
    required this.password,
    required this.nationality,
    required this.gender,
    required this.timezone,
    required this.mac,
  });
}

class AuthChooseLevelEvent extends AuthEvent {
  String level;
  AuthChooseLevelEvent({
    required this.level,
  });
}
