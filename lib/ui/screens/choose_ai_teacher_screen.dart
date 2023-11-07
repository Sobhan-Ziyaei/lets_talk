import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lets_talk/gen/assets.gen.dart';
import 'package:lets_talk/ui/constants/app_strings.dart';
import 'package:lets_talk/ui/screens/main%20screen/main_screen.dart';
import 'package:lets_talk/ui/screens/welcome_screen.dart';
import 'package:lets_talk/ui/theme/colors.dart';
import 'package:lets_talk/ui/widgets/app_blue_button.dart';

class ChooseAiTeacherScreen extends StatelessWidget {
  const ChooseAiTeacherScreen({Key? key}) : super(key: key);
  static const screenId = 'choose_ai_teacher_screen';
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),
                      Text(
                        ChooseAiTeacherStrings.chooseAiTeacher,
                        style:
                            theme.textTheme.titleLarge?.copyWith(fontSize: 22),
                      ),
                      SizedBox(height: size.height * 0.05),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: getCardItem(
                                title: ChooseAiTeacherStrings.marry,
                                path: Assets.images.svg.marryAi.path),
                          ),
                          SizedBox(width: size.width * 0.15),
                          Expanded(
                            child: getCardItem(
                                title: ChooseAiTeacherStrings.dav,
                                path: Assets.images.svg.davAi.path),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: getCardItem(
                                title: ChooseAiTeacherStrings.sara,
                                path: Assets.images.svg.saraAi.path),
                          ),
                          SizedBox(width: size.width * 0.15),
                          Expanded(
                            child: getCardItem(
                                title: ChooseAiTeacherStrings.mo,
                                path: Assets.images.svg.moAi.path),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: getCardItem(
                                title: ChooseAiTeacherStrings.sali,
                                path: Assets.images.svg.saliAi.path),
                          ),
                          SizedBox(width: size.width * 0.15),
                          Expanded(
                            child: Container(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
                child: Column(
                  children: [
                    const Spacer(),
                    AppBlueButton(
                      title: AppStrings.next,
                      onPressed: () {
                        Navigator.pushNamed(context, WelcomeScreen.screenId);
                      },
                    ),
                    SizedBox(height: size.height * 0.03),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class getCardItem extends StatelessWidget {
  String title;
  String path;
  getCardItem({super.key, required this.title, required this.path});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.bodySmall?.copyWith(
            color: darkBlueColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: size.height * 0.03),
        Container(
          height: size.height * 0.15,
          color: milkyColor,
          child: Center(
            child: SvgPicture.asset(
              path,
              height: size.height * 0.09,
            ),
          ),
        ),
      ],
    );
  }
}
