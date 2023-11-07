// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:lets_talk/data/di/di.dart';
import 'package:lets_talk/util/auth_manager.dart';

abstract class IAuthenticationDatasource {
  Future<void> register(String username, String phone, String password,
      String nationality, String gender, String timezone, String mac);

  Future<String> login(
      String phone, String password, String timezone, String mac);

  Future<String> forgetPass(String phone);

  Future<void> chooseLevel(String level);
}

class AuthenticationRemote extends IAuthenticationDatasource {
  final Dio dio = locator.get();
  @override
  Future<void> register(String username, String phone, String password,
      String nationality, String gender, String timezone, String mac) async {
    try {
      var response = await dio.post(
        'auth/registration/',
        data: {
          'username': username,
          'phone': phone,
          'password': password,
          'nationality': nationality,
          'gender': gender,
          'active_time_zone': timezone,
          'mac_address': mac
        },
      );
      AuthManager.saveToken(response.data['access']);
    } on DioException catch (ex) {
      print(ex.message);
      print(ex.response?.data['message']);
    } catch (ex) {
      print(ex);
    }
  }

  @override
  Future<String> login(
      String phone, String password, String timezone, String mac) async {
    try {
      var response = await dio.post('auth/login/', data: {
        'phone': phone,
        'password': password,
        'active_time_zone': timezone,
        'mac_address': mac
      });
      if (response.statusCode == 200) {
        return response.data['access'];
      }
    } on DioException catch (ex) {
      print(ex.message);
      print(ex.response?.data['message']);
    } catch (ex) {
      print(ex);
    }
    return '';
  }

  @override
  Future<void> chooseLevel(String level) async {
    try {
      await dio.post(
        'lvl/english-level/',
        data: {
          'level': level,
        },
        options: Options(
          headers: {
            'Authorization': 'JWT ${AuthManager.readAuth()}',
          },
        ),
      );
    } on DioException catch (ex) {
      print(ex.message);
      print(ex.response?.data['message']);
    } catch (ex) {
      print(ex);
    }
  }

  @override
  Future<String> forgetPass(String phone) async {
    try {
      var code = await dio.post(
        'auth/forget-password/',
        data: {
          'phone': phone,
        },
      );
      return code.data['Token'];
    } on DioException catch (ex) {
      print(ex.message);
      print(ex.response?.data['message']);
    } catch (ex) {
      print(ex);
    }
    return '';
  }
}
