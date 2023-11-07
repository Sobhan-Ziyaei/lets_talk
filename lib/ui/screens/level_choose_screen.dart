import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lets_talk/bloc/authentication/auth_bloc.dart';
import 'package:lets_talk/bloc/authentication/auth_event.dart';
import 'package:lets_talk/bloc/authentication/auth_state.dart';
import 'package:lets_talk/gen/assets.gen.dart';
import 'package:lets_talk/ui/constants/app_strings.dart';
import 'package:lets_talk/ui/screens/choose_ai_teacher_screen.dart';
import 'package:lets_talk/ui/theme/colors.dart';
import 'package:lets_talk/ui/widgets/app_blue_button.dart';
import 'package:lets_talk/util/auth_manager.dart';

class LevelChooseScreen extends StatefulWidget {
  const LevelChooseScreen({Key? key}) : super(key: key);
  static const screenId = 'level_choose_screen';

  @override
  State<LevelChooseScreen> createState() => _LevelChooseScreenState();
}

class _LevelChooseScreenState extends State<LevelChooseScreen> {
  String? level;
  bool levelSelected = false;
  bool isBasicLevelSelected = false;
  bool isInterLevelSelected = false;
  bool isPreInterLevelSelected = false;
  bool isAdvanceLevelSelected = false;
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
                        LevelChooseStrings.chooseLevel,
                        style: theme.textTheme.titleLarge,
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
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  isBasicLevelSelected = !isBasicLevelSelected;
                                  isAdvanceLevelSelected = false;
                                  isInterLevelSelected = false;
                                  isPreInterLevelSelected = false;
                                  level = 'BA';
                                });
                              },
                              child: getCardItem(
                                title: LevelChooseStrings.basic,
                                path: Assets.images.svg.basicImg.path,
                                color: isBasicLevelSelected
                                    ? darkBlueColor
                                    : milkyColor,
                              ),
                            ),
                          ),
                          SizedBox(width: size.width * 0.07),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  isInterLevelSelected = !isInterLevelSelected;
                                  isAdvanceLevelSelected = false;
                                  isBasicLevelSelected = false;
                                  isPreInterLevelSelected = false;
                                  level = 'IN';
                                });
                              },
                              child: getCardItem(
                                title: LevelChooseStrings.intermediate,
                                path: Assets.images.svg.intermediateImg.path,
                                color: isInterLevelSelected
                                    ? darkBlueColor
                                    : milkyColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  isPreInterLevelSelected =
                                      !isPreInterLevelSelected;
                                  isBasicLevelSelected = false;
                                  isAdvanceLevelSelected = false;
                                  isInterLevelSelected = false;
                                  level = 'IN';
                                });
                              },
                              child: getCardItem(
                                title: LevelChooseStrings.preIntermediate,
                                path: Assets.images.svg.preIntermediateImg.path,
                                color: isPreInterLevelSelected
                                    ? darkBlueColor
                                    : milkyColor,
                              ),
                            ),
                          ),
                          SizedBox(width: size.width * 0.07),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  isAdvanceLevelSelected =
                                      !isAdvanceLevelSelected;
                                  isBasicLevelSelected = false;
                                  isPreInterLevelSelected = false;
                                  isInterLevelSelected = false;
                                  level = 'AD';
                                });
                              },
                              child: getCardItem(
                                title: LevelChooseStrings.advance,
                                path: Assets.images.svg.advanceImg.path,
                                color: isAdvanceLevelSelected
                                    ? darkBlueColor
                                    : milkyColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is AuthInitialState) {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.07),
                    child: Column(
                      children: [
                        AppBlueButton(
                          title: AppStrings.next,
                          onPressed: () {
                            BlocProvider.of<AuthBloc>(context)
                                .add(AuthChooseLevelEvent(level: level!));
                            AuthManager.saveLevel(level!);
                          },
                        ),
                        SizedBox(height: size.height * 0.03),
                      ],
                    ),
                  );
                }
                if (state is AuthLoadingState) {
                  return const SpinKitCircle(color: Colors.black);
                }
                if (state is AuthChooseLevelResponseState) {
                  Widget? result;
                  state.chooseLevelResponse.fold(
                    (l) {
                      result = l;
                    },
                    (r) {
                      result = r;
                      SchedulerBinding.instance
                          .addPostFrameCallback((timeStamp) {
                        Navigator.pushNamed(
                            context, ChooseAiTeacherScreen.screenId);
                      });
                    },
                  );
                  return Column(
                    children: [
                      result ?? const SizedBox(),
                      SizedBox(height: size.height * 0.03),
                      AppBlueButton(
                        title: AppStrings.next,
                        onPressed: () {
                          BlocProvider.of<AuthBloc>(context)
                              .add(AuthChooseLevelEvent(level: level!));
                        },
                      ),
                    ],
                  );
                }
                return Text('خطای نامشخص', style: theme.textTheme.titleLarge);
              },
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
  Color color;
  getCardItem(
      {super.key,
      required this.title,
      required this.path,
      required this.color});

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
          ),
        ),
        SizedBox(height: size.height * 0.03),
        Container(
          height: size.height * 0.20,
          color: color,
          child: Center(
            child: SvgPicture.asset(
              path,
              height: size.height * 0.10,
            ),
          ),
        ),
      ],
    );
  }
}
