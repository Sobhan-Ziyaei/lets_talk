import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lets_talk/bloc/environment/environment_bloc.dart';
import 'package:lets_talk/gen/assets.gen.dart';
import 'package:lets_talk/ui/constants/app_strings.dart';
import 'package:lets_talk/ui/screens/environment%20&%20role%20screens%20&%20chat%20screens/environment_screen.dart';
import 'package:lets_talk/ui/theme/colors.dart';
import 'package:lets_talk/ui/widgets/home_card_item.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ValueNotifier<double> notifier = ValueNotifier(54);
  PageController controller = PageController();
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: Column(
              children: [
                SizedBox(height: size.height * 0.02),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SvgPicture.asset(Assets.images.svg.userIconImg.path),
                    const SizedBox(width: 10),
                    Text(
                      HomeScreenStrings.hello,
                      style: theme.textTheme.titleLarge,
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.03),
                Container(
                  width: size.width,
                  height: size.height * 0.25,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                    color: darkOrangeColor,
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 30),
                      SimpleCircularProgressBar(
                        size: 80,
                        startAngle: 90.0,
                        valueNotifier: notifier,
                        animationDuration: 2,
                        backColor: whiteColor,
                      ),
                      SizedBox(width: size.width * 0.15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(AppStrings.score,
                              style: theme.textTheme.bodyLarge),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Row(
                            children: [
                              Text('54', style: theme.textTheme.bodyMedium),
                              SizedBox(
                                width: size.width * 0.01,
                              ),
                              Text(
                                '/100',
                                style: theme.textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                SizedBox(
                  width: size.width,
                  height: size.height / 2.25,
                  child: PageView(
                    controller: controller,
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return BlocProvider(
                                            create: (context) =>
                                                EnvironmentBloc(),
                                            child: EnvironmentScreen(id: 556),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  child: HomeCardItem(
                                    path: Assets.images.png.travelImage.path,
                                    title: HomeScreenStrings.travel,
                                    subTitle: HomeScreenStrings.completed74,
                                    progressBarBackground: lightGreyColor,
                                    progressBarValueColor: lightBlueColor,
                                  ),
                                ),
                              ),
                              SizedBox(width: size.width * 0.03),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return BlocProvider(
                                            create: (context) =>
                                                EnvironmentBloc(),
                                            child: EnvironmentScreen(id: 553),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  child: HomeCardItem(
                                    path: Assets.images.png.pharmacyImage.path,
                                    title: HomeScreenStrings.pharmacy,
                                    subTitle: HomeScreenStrings.completed54,
                                    progressBarBackground: lightGreyColor,
                                    progressBarValueColor: lightOrangeColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.015),
                          Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return BlocProvider(
                                            create: (context) =>
                                                EnvironmentBloc(),
                                            child: EnvironmentScreen(id: 555),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  child: HomeCardItem(
                                    path: Assets.images.png.hotelImage.path,
                                    title: HomeScreenStrings.hotel,
                                    subTitle: HomeScreenStrings.completed100,
                                    progressBarBackground: lightGreyColor,
                                    progressBarValueColor: greenColor,
                                  ),
                                ),
                              ),
                              SizedBox(width: size.width * 0.03),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return BlocProvider(
                                            create: (context) =>
                                                EnvironmentBloc(),
                                            child: EnvironmentScreen(id: 558),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  child: HomeCardItem(
                                    path: Assets.images.png.shoppingImage.path,
                                    title: HomeScreenStrings.shopping,
                                    subTitle: HomeScreenStrings.completed100,
                                    progressBarBackground: lightGreyColor,
                                    progressBarValueColor: lightBlueColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return BlocProvider(
                                            create: (context) =>
                                                EnvironmentBloc(),
                                            child: EnvironmentScreen(id: 554),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  child: HomeCardItem(
                                    path: Assets.images.png.travelImage.path,
                                    title: HomeScreenStrings.store,
                                    subTitle: HomeScreenStrings.completed74,
                                    progressBarBackground: lightGreyColor,
                                    progressBarValueColor: lightBlueColor,
                                  ),
                                ),
                              ),
                              SizedBox(width: size.width * 0.03),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return BlocProvider(
                                            create: (context) =>
                                                EnvironmentBloc(),
                                            child: EnvironmentScreen(id: 557),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  child: HomeCardItem(
                                    path: Assets.images.png.pharmacyImage.path,
                                    title: HomeScreenStrings.restaurant,
                                    subTitle: HomeScreenStrings.completed54,
                                    progressBarBackground: lightGreyColor,
                                    progressBarValueColor: lightOrangeColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.015),
                          Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return BlocProvider(
                                            create: (context) =>
                                                EnvironmentBloc(),
                                            child: EnvironmentScreen(id: 559),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  child: HomeCardItem(
                                    path: Assets.images.png.hotelImage.path,
                                    title: HomeScreenStrings.office,
                                    subTitle: HomeScreenStrings.completed100,
                                    progressBarBackground: lightGreyColor,
                                    progressBarValueColor: greenColor,
                                  ),
                                ),
                              ),
                              SizedBox(width: size.width * 0.03),
                              const Expanded(
                                child: SizedBox(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SmoothPageIndicator(
                  controller: controller,
                  count: 2,
                  effect: const ExpandingDotsEffect(
                    expansionFactor: 3,
                    dotHeight: 10,
                    dotWidth: 10,
                    activeDotColor: darkBlueColor,
                    dotColor: lightGreyColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
