import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lets_talk/bloc/grammer/grammer_bloc.dart';
import 'package:lets_talk/gen/assets.gen.dart';
import 'package:lets_talk/ui/constants/app_strings.dart';
import 'package:lets_talk/ui/screens/activity_report_screen.dart';
import 'package:lets_talk/ui/screens/favorite_screen.dart';
import 'package:lets_talk/ui/screens/grammer%20screens/grammer_screen.dart';
import 'package:lets_talk/ui/screens/mistakes_screen.dart';
import 'package:lets_talk/ui/theme/colors.dart';
import 'package:lets_talk/ui/widgets/app_main_app_bar.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Center(
                child: Column(
                  children: [
                    AppMainAppBar(
                      icon: const SizedBox(),
                      title: ActivityScreenStrings.activityTitle,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.07),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          SizedBox(
                            width: size.width,
                            height: 200,
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            left: 0,
                            child: Container(
                              height: 170,
                              width: size.width,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    darkBlueColor,
                                    lightBlueColor,
                                  ],
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(width: size.width * 0.05),
                                  SizedBox(
                                    height: size.height * 0.13,
                                    width: size.height * 0.13,
                                    child: CircleAvatar(
                                      backgroundColor: mediumBlueColor,
                                      child: Assets.images.png.bookImg.image(),
                                    ),
                                  ),
                                  SizedBox(width: size.width * 0.03),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          ActivityScreenStrings
                                              .activityCheckPronoun,
                                          style: theme.textTheme.bodySmall
                                              ?.copyWith(
                                            color: whiteColor,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(height: size.height * 0.02),
                                        Text(
                                          ActivityScreenStrings
                                              .activityCheckPronounSubTitle,
                                          style: theme.textTheme.bodySmall
                                              ?.copyWith(
                                            color: whiteColor,
                                            fontSize: 18,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 50,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 15,
                            child: Container(
                              width: 150,
                              height: 30,
                              decoration: const BoxDecoration(
                                color: milkyColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Assets.images.png.playImg.image(),
                                  Text(
                                    ActivityScreenStrings.continueText,
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: darkBlueColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
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
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                color: milkyColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.03),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return BlocProvider(
                                            create: (context) => GrammerBloc(),
                                            child: const GrammerScreen(),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Assets.images.png.grammerImg
                                                .image(),
                                            Text(
                                              ActivityScreenStrings.grammer,
                                              style: theme.textTheme.bodySmall
                                                  ?.copyWith(
                                                color: darkBlueColor,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Expanded(
                                        flex: 1,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                          child: LinearProgressIndicator(
                                            minHeight: 10,
                                            value: 0.4,
                                            backgroundColor: lightGreyColor,
                                            color: mediumBlueColor,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: size.height * 0.03),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: size.height * 0.03),
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                color: milkyColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.03),
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, MistakesScreen.screenId);
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Assets.images.png.mistakeImg
                                                .image(),
                                            Text(
                                              ActivityScreenStrings.mistakes,
                                              style: theme.textTheme.bodySmall
                                                  ?.copyWith(
                                                color: darkBlueColor,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const Expanded(
                                      flex: 1,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)),
                                        child: LinearProgressIndicator(
                                          minHeight: 10,
                                          value: 0.4,
                                          backgroundColor: lightGreyColor,
                                          color: lightOrangeColor,
                                        ),
                                      ),
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
                    SizedBox(width: size.width * 0.04),
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: milkyColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Assets.images.png.mockImg.image(),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      ActivityScreenStrings.ielts,
                                      style:
                                          theme.textTheme.bodySmall?.copyWith(
                                        color: darkBlueColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      ActivityScreenStrings.mockTest,
                                      style:
                                          theme.textTheme.bodySmall?.copyWith(
                                        color: darkBlueColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: size.height * 0.03),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: size.height * 0.02),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () => Navigator.pushNamed(
                                  context, FavoriteScreen.screenId),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: milkyColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Assets.images.png.favoriteImg.image(),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          ActivityScreenStrings.favorite,
                                          style: theme.textTheme.bodySmall
                                              ?.copyWith(
                                            color: darkBlueColor,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          ActivityScreenStrings.words500,
                                          style: theme.textTheme.bodySmall
                                              ?.copyWith(
                                            color: lightBlueColor,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            ActivityScreenStrings.yourActivity,
                            style: theme.textTheme.titleLarge,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () => Navigator.pushNamed(
                            context, ActivityReportScreen.screenId),
                        child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: milkyColor,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Row(
                            children: [
                              Assets.images.png.activityImg.image(),
                              const Spacer(),
                              Text(
                                ActivityScreenStrings.weekly,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: darkBlueColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                              SizedBox(width: size.width * 0.05),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.07),
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
