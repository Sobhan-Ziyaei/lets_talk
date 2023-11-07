import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:lets_talk/data/models/environment.dart';

abstract class EnvironmentState {}

class EnvironmentInitialState extends EnvironmentState {}

class EnvironmentLoadingState extends EnvironmentState {}

class EnvironmentTopicResponseState extends EnvironmentState {
  Either<Widget, List<EnvironmentTopic>> environmentTopicListResponse;
  EnvironmentTopicResponseState({required this.environmentTopicListResponse});
}

class EnvironmentRoleResponseStata extends EnvironmentState {
  Either<Widget, List<EnvironmentRole>> environmentRoleListResponse;
  EnvironmentRoleResponseStata({required this.environmentRoleListResponse});
}

class EnvironmentChatResponseState extends EnvironmentState {
  List<EnvironmentChat> environmentChatResponse;
  EnvironmentChatResponseState({required this.environmentChatResponse});
}
