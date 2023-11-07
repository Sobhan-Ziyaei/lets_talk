import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

abstract class AuthState {}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthRegisterResponseState extends AuthState {
  Either<Widget, Widget> registerResponse;
  AuthRegisterResponseState({required this.registerResponse});
}

class AuthLoginResponseState extends AuthState {
  Either<Widget, Widget> loginResponse;
  AuthLoginResponseState({required this.loginResponse});
}

class AuthChooseLevelResponseState extends AuthState {
  Either<Widget,Widget> chooseLevelResponse ;
  AuthChooseLevelResponseState({required this.chooseLevelResponse});
}
