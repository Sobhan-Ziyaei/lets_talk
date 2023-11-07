import 'package:lets_talk/data/di/di.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthManager {
  static final SharedPreferences sharePref = locator.get();

  static void saveLevel(String level) async {
    sharePref.setString('level', level);
  }

  static String readLevel() {
    return sharePref.getString('level') ?? '';
  }

  static void saveTimezone(String timezone) async {
    sharePref.setString('time_zone', timezone);
  }

  static String readTimezone() {
    return sharePref.getString('time_zone') ?? '';
  }

  static void saveMac(String mac) async {
    sharePref.setString('mac_address', mac);
  }

  static String readMac() {
    return sharePref.getString('mac_address') ?? '';
  }

  static void saveToken(String token) async {
    sharePref.setString('access_token', token);
  }

  static String readAuth() {
    return sharePref.getString('access_token') ?? '';
  }

  static void logout() {
    sharePref.clear();
  }

  static bool isLoggedIn() {
    String token = readAuth();
    return token.isNotEmpty;
  }
}
