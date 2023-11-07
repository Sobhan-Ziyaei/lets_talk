import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lets_talk/gen/assets.gen.dart';
import 'package:lets_talk/ui/screens/auth/login_screen.dart';
import 'package:lets_talk/ui/screens/main%20screen/main_screen.dart';
import 'package:lets_talk/ui/theme/colors.dart';
import 'package:lets_talk/util/auth_manager.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);
  static const screenId = '/splash_screen';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateScreen();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(Assets.lottie.splashAnim, height: 300),
              SizedBox(height: size.height * 0.03),
              const SpinKitChasingDots(
                size: 50,
                color: blackColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
  //
  Future<void> navigateScreen() async {
    Future.delayed(const Duration(seconds: 5)).then(
      (value) {
        if (AuthManager.readAuth().isEmpty) {
          Navigator.pushReplacementNamed(context, LoginScreen.screenId).then(
            (value) {
              return SystemNavigator.pop();
            },
          );
        } else {
          Navigator.pushReplacementNamed(context, MainScreen.screenId);
        }
      },
    );
  }
}
