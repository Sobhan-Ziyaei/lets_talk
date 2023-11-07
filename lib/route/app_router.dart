import 'package:flutter/material.dart';
import 'package:lets_talk/ui/screens/activity_report_screen.dart';
import 'package:lets_talk/ui/screens/auth/login_screen.dart';
import 'package:lets_talk/ui/screens/auth/register_screen2.dart';
import 'package:lets_talk/ui/screens/choose_ai_teacher_screen.dart';
import 'package:lets_talk/ui/screens/environment%20&%20role%20screens%20&%20chat%20screens/conversion_screen.dart';
import 'package:lets_talk/ui/screens/favorite_screen.dart';
import 'package:lets_talk/ui/screens/grammer%20screens/grammer_screen.dart';
import 'package:lets_talk/ui/screens/level_choose_screen.dart';
import 'package:lets_talk/ui/screens/mistakes_screen.dart';
import 'package:lets_talk/ui/screens/premium_screen.dart';
import 'package:lets_talk/ui/screens/auth/forget_password_screen.dart';
import 'package:lets_talk/ui/screens/auth/register_screen.dart';
import 'package:lets_talk/ui/screens/environment%20&%20role%20screens%20&%20chat%20screens/role_screen.dart';
import 'package:lets_talk/ui/screens/main%20screen/main_screen.dart';
import 'package:lets_talk/ui/screens/splash_screen.dart';
import 'package:lets_talk/ui/screens/welcome_screen.dart';

class AppRouter {
  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.screenId:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case MainScreen.screenId:
        return MaterialPageRoute(
          builder: (context) => MainScreen(),
        );
      // case EnvironmentScreen.screenId:
      //   return MaterialPageRoute(
      //     builder: (context) => EnvironmentScreen(),
      //   );
      // case RoleScreen.screenId:
      //   return MaterialPageRoute(
      //     builder: (context) => const RoleScreen(),
      //   );
      case ConversationScreen.screenId:
        return MaterialPageRoute(
          builder: (context) => ConversationScreen(),
        );
      case RegiseterScreen.screenId:
        return MaterialPageRoute(
          builder: (context) => const RegiseterScreen(),
        );
      case GrammerScreen.screenId:
        return MaterialPageRoute(
          builder: (context) => const GrammerScreen(),
        );
      case MistakesScreen.screenId:
        return MaterialPageRoute(
          builder: (context) => MistakesScreen(),
        );
      case LevelChooseScreen.screenId:
        return MaterialPageRoute(
          builder: (context) => const LevelChooseScreen(),
        );
      case ChooseAiTeacherScreen.screenId:
        return MaterialPageRoute(
          builder: (context) => const ChooseAiTeacherScreen(),
        );
      case WelcomeScreen.screenId:
        return MaterialPageRoute(
          builder: (context) => const WelcomeScreen(),
        );
      case ForgetPasswordScreen.screenId:
        return MaterialPageRoute(
          builder: (context) => const ForgetPasswordScreen(),
        );
      case ActivityReportScreen.screenId:
        return MaterialPageRoute(
          builder: (context) => ActivityReportScreen(),
        );
      case FavoriteScreen.screenId:
        return MaterialPageRoute(
          builder: (context) => const FavoriteScreen(),
        );

      case PremiumScreen.screenId:
        return MaterialPageRoute(
          builder: (context) => const PremiumScreen(),
        );
      case RegisterScreen2.screenId:
        var argument = settings.arguments as List<String>;
        return MaterialPageRoute(
          builder: (context) => RegisterScreen2(userInfo: argument),
        );
      case LoginScreen.screenId:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      default:
        return null;
    }
  }
}
