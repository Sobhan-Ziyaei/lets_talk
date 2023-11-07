import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:lets_talk/data/models/grammer.dart';

abstract class GrammerState {}

class GrammerInitialState extends GrammerState {}

class GrammerLoadingState extends GrammerState {}

class GrammerTopicsResponseState extends GrammerState {
  Either<Widget, GrammerTopics?> grammerTopicResponse;
  GrammerTopicsResponseState({required this.grammerTopicResponse});
}

class GrammerContentResponseState extends GrammerState {
  Either<Widget, GrammerContent?> grammerContentResponse;
  GrammerContentResponseState({required this.grammerContentResponse});
}
