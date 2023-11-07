import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:lets_talk/data/datasource/grammer_datasource.dart';
import 'package:lets_talk/data/di/di.dart';
import 'package:lets_talk/data/models/grammer.dart';

abstract class IGrammerRepository {
  Future<Either<Widget, GrammerTopics?>> getGrammerTopic(String level);
  Future<Either<Widget, GrammerContent?>> getGrammerContent(String id,String level);
}

class GrammerRepository extends IGrammerRepository {
  final IGrammerDatasource datasource = locator.get();

  @override
  Future<Either<Widget, GrammerTopics?>> getGrammerTopic(String level) async {
    try {
      var grammerTopic = await datasource.getGrammerTopic(level);
      return right(grammerTopic);
    } catch (ex) {
      return left(
        const Text('Not Ok'),
      );
    }
  }

  @override
  Future<Either<Widget, GrammerContent?>> getGrammerContent(String id,String level) async {
    try {
      var grammerContent = await datasource.getGrammerContent(id,level);
      return right(grammerContent);
    } catch (ex) {
      return left(
        const Text('Not Ok'),
      );
    }
  }
}
