// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:lets_talk/data/di/di.dart';
import 'package:lets_talk/data/models/environment.dart';
import 'package:lets_talk/util/auth_manager.dart';

abstract class IEnvironmentDatasource {
  Future<List<EnvironmentTopic>> getEnvironmentTopic(int id);
  Future<List<EnvironmentRole>> getEnvironmentRole(int id);
  Future<List<EnvironmentChat>> getEnvironmentChat(
      int roleIdUser, int roleIdAi);
}

class EnvironmentDataRemote extends IEnvironmentDatasource {
  final Dio dio = locator.get();

  @override
  Future<List<EnvironmentTopic>> getEnvironmentTopic(int id) async {
    try {
      var response = await dio.get(
        'env/get-topics/$id/',
        options: Options(
          headers: {
            'Authorization': 'JWT ${AuthManager.readAuth()}',
          },
        ),
      );
      List<EnvironmentTopic> environmentTopicList = response.data['data']
              ['topics']
          .map<EnvironmentTopic>(
              (jsonObject) => EnvironmentTopic.fromMapJson(jsonObject))
          .toList();
      return environmentTopicList;
    } on DioException catch (ex) {
      print(ex.message);
      print(ex.response?.data['message']);
      return [];
    } catch (ex) {
      print(ex);
      return [];
    }
  }

  @override
  Future<List<EnvironmentRole>> getEnvironmentRole(int id) async {
    try {
      var response = await dio.get(
        'env/get-roles/$id/',
        options: Options(
          headers: {
            'Authorization': 'JWT ${AuthManager.readAuth()}',
          },
        ),
      );
      List<EnvironmentRole> environmentRoleList = response.data['data']['roles']
          .map<EnvironmentRole>(
              (jsonObjcet) => EnvironmentRole.fromMapJson(jsonObjcet))
          .toList();
      return environmentRoleList;
    } on DioException catch (ex) {
      print(ex.message);
      print(ex.response?.data['message']);
      return [];
    } catch (ex) {
      print(ex);
      return [];
    }
  }

  @override
  Future<List<EnvironmentChat>> getEnvironmentChat(
      int roleIdUser, int roleIdAi) async {
    try {
      var response = await dio.get(
        'env/start-conversation/',
        data: {
          'role_id_user': roleIdUser,
          'role_id_ai': roleIdAi,
        },
        options: Options(
          headers: {
            'Authorization': 'JWT ${AuthManager.readAuth()}',
          },
        ),
      );
      List<EnvironmentChat> environmentChatList = response.data['data']['chat']
          .map<EnvironmentChat>((chat) => EnvironmentChat.fromMapJson(chat))
          .toList();
      return environmentChatList ;
    } catch (ex) {
      print(ex);
      return [];
    }
  }
}
