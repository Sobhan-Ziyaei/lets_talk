// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:lets_talk/data/di/di.dart';
import 'package:lets_talk/data/models/grammer.dart';
import 'package:lets_talk/util/auth_manager.dart';

abstract class IGrammerDatasource {
  Future<GrammerTopics?> getGrammerTopic(String level);
  Future<GrammerContent?> getGrammerContent(String id,String level);
}

class GrammerRemote extends IGrammerDatasource {
  final Dio dio = locator.get();

  @override
  Future<GrammerTopics?> getGrammerTopic(String level) async {
    try {
      var response = await dio.get(
        'grammer/get-grammer-topics/${AuthManager.readLevel()}',
      );
      Map<String, dynamic> data = response.data[level];
      return GrammerTopics.fromJson(data);
    } catch (ex) {
      print('Error fetching grammar topics: $ex');
      return null;
    }
  }

  @override
  Future<GrammerContent?> getGrammerContent(String id,String level) async {
    try {
      var response = await dio
          .get('grammer/get-grammer-lesson/$level/$id');
      return GrammerContent.fromMapJson(
        response.data,
      );
    } catch (ex) {
      print(ex);
      return null ;
    }
  }
}
