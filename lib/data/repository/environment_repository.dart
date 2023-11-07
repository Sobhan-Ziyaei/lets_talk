// ignore_for_file: avoid_print

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:lets_talk/data/datasource/environment_datasource.dart';
import 'package:lets_talk/data/di/di.dart';
import 'package:lets_talk/data/models/environment.dart';

abstract class IEnvironmentRepository {
  Future<Either<Widget, List<EnvironmentTopic>>> getEnvironmentTopic(int id);
  Future<Either<Widget, List<EnvironmentRole>>> getEnvironmentRole(int id);
  Future<List<EnvironmentChat>> getEnvironmentChat(
      int roleIdUser, int roleIdAi);
}

class EnvironmentRepository extends IEnvironmentRepository {
  final IEnvironmentDatasource datasource = locator.get();

  @override
  Future<Either<Widget, List<EnvironmentTopic>>> getEnvironmentTopic(
      int id) async {
    try {
      List<EnvironmentTopic> environmentTopicList =
          await datasource.getEnvironmentTopic(id);
      return right(environmentTopicList);
    } catch (ex) {
      return left(
        const Text('Not Ok'),
      );
    }
  }

  @override
  Future<Either<Widget, List<EnvironmentRole>>> getEnvironmentRole(
      int id) async {
    try {
      List<EnvironmentRole> environmentRoleList =
          await datasource.getEnvironmentRole(id);
      return right(environmentRoleList);
    } catch (ex) {
      return left(
        const Text('Not Ok'),
      );
    }
  }

  @override
  Future<List<EnvironmentChat>> getEnvironmentChat(
      int roleIdUser, int roleIdAi) async {
    try {
      List<EnvironmentChat> environmentChatList =
          await datasource.getEnvironmentChat(roleIdUser, roleIdAi);
      return environmentChatList;
    } catch (e) {
      print('ex');
      return [];
    }
  }
}
