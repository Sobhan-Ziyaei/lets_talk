import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lets_talk/bloc/authentication/auth_bloc.dart';
import 'package:lets_talk/data/di/di.dart';
import 'package:lets_talk/route/app_router.dart';
import 'package:lets_talk/ui/screens/splash_screen.dart';
import 'package:lets_talk/ui/theme/theme.dart';


GlobalKey<NavigatorState> globalNavigatorKey = GlobalKey<NavigatorState>() ;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getItInit();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(),
        ),
      ],
      child: MyApp(
        appRouter: AppRouter(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRouter}) : super(key: key);
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: globalNavigatorKey,
      theme: CustomTheme.lightTheme.copyWith(useMaterial3: false),
      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.onGenerateRoute,
      initialRoute: SplashScreen.screenId,
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}
