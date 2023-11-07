import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lets_talk/gen/assets.gen.dart';
import 'package:lets_talk/ui/constants/app_strings.dart';
import 'package:lets_talk/ui/screens/main%20screen/main_screen.dart';
import 'package:lets_talk/ui/theme/colors.dart';
import 'package:lets_talk/ui/widgets/app_blue_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static const screenId = '/welcome_screen';
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Center(
                child:
                    SvgPicture.asset(Assets.images.svg.welcomeNoAnimImg.path),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: size.height * 0.05),
                      Text(
                        AppStrings.welcomeScreenText,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: darkBlueColor,
                          fontSize: 30,
                          height: 1.3,
                        ),
                      ),
                      const Spacer(),
                      AppBlueButton(
                        title: AppStrings.getStart,
                        onPressed: () {
                          Navigator.pushNamed(context, MainScreen.screenId);
                        },
                      ),
                      SizedBox(height: size.height * 0.03),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
