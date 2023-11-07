import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:lets_talk/data/datasource/authentication_datasource.dart';
import 'package:lets_talk/data/di/di.dart';
import 'package:lets_talk/gen/fonts.gen.dart';
import 'package:lets_talk/ui/constants/app_strings.dart';
import 'package:lets_talk/ui/theme/colors.dart';
import 'package:lets_talk/util/auth_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IAuthRepository {
  Future<Either<Widget, Widget>> register(
      String username,
      String phone,
      String password,
      String nationality,
      String gender,
      String timezone,
      String mac);

  Future<Either<Widget, Widget>> login(
      String phone, String password, String timezone, String mac);

  //Future<Either<Widget,Widget>> forgetPass(String phone);

  Future<Either<Widget, Widget>> chooseLevel(String level);
}

class AuthenticationRepository extends IAuthRepository {
  final IAuthenticationDatasource datasource = locator.get();
  final SharedPreferences sharePref = locator.get();
  @override
  Future<Either<Widget, Widget>> register(
      String username,
      String phone,
      String password,
      String nationality,
      String gender,
      String timezone,
      String mac) async {
    try {
      await datasource.register(
          username, phone, password, nationality, gender, timezone, mac);
      return right(
        const Text(
          FormStrings.registerOk,
          style: TextStyle(
            fontFamily: FontFamily.arEB,
            fontSize: 17,
            color: greenColor,
          ),
        ),
      );
    } catch (ex) {
      return left(
        const Text(
          FormStrings.registerError,
          style: TextStyle(
            fontFamily: FontFamily.arEB,
            fontSize: 17,
            color: redColor,
          ),
        ),
      );
    }
  }

  @override
  Future<Either<Widget, Widget>> login(
      String phone, String password, String timezone, String mac) async {
    try {
      String token = await datasource.login(phone, password, timezone, mac);
      if (token.isNotEmpty) {
        AuthManager.saveToken(token);
        return right(
          const Text(
            FormStrings.loginOk,
            style: TextStyle(
              fontFamily: FontFamily.arEB,
              fontSize: 17,
              color: greenColor,
            ),
          ),
        );
      } else {
        return left(
          const Text(
            FormStrings.loginError,
            style: TextStyle(
              fontFamily: FontFamily.arEB,
              fontSize: 17,
              color: redColor,
            ),
          ),
        );
      }
    } catch (ex) {
      return left(Text(ex.toString()));
    }
  }

  @override
  Future<Either<Widget, Widget>> chooseLevel(String level) async {
    try {
      await datasource.chooseLevel(level);
      return right(
        const Text(
          LevelChooseStrings.apiTextChoose,
          style: TextStyle(
            fontFamily: FontFamily.arEB,
            fontSize: 17,
            color: greenColor,
          ),
        ),
      );
    } catch (ex) {
      return Left(
        Text(
          ex.toString(),
          style: const TextStyle(
            fontFamily: FontFamily.arEB,
            fontSize: 17,
            color: redColor,
          ),
        ),
      );
    }
  }

  // @override
  // Future<Either<Widget, Widget>> forgetPass(String phone) async{
  //   try {
  //     await datasource.forgetPass(phone) ;
  //     return right(Text(data))
  //   } catch (ex) {

  //   }
  // }
}
