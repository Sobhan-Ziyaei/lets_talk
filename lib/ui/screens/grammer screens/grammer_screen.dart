import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lets_talk/bloc/grammer/grammer_bloc.dart';
import 'package:lets_talk/bloc/grammer/grammer_event.dart';
import 'package:lets_talk/bloc/grammer/grammer_state.dart';
import 'package:lets_talk/gen/assets.gen.dart';
import 'package:lets_talk/ui/constants/app_strings.dart';
import 'package:lets_talk/ui/screens/grammer%20screens/grammer_lesson_screen.dart';
import 'package:lets_talk/ui/theme/colors.dart';
import 'package:lets_talk/ui/widgets/app_main_app_bar.dart';
import 'package:lets_talk/util/auth_manager.dart';

class GrammerScreen extends StatefulWidget {
  const GrammerScreen({Key? key}) : super(key: key);
  static const screenId = '/grammer_screen';

  @override
  State<GrammerScreen> createState() => _GrammerScreenState();
}

class _GrammerScreenState extends State<GrammerScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppMainAppBar(
          icon: InkWell(
            onTap: () => Navigator.pop(context),
            child: const SizedBox(
              width: 70,
              height: 40,
              child: Icon(Icons.arrow_back_ios_new_rounded),
            ),
          ),
          title: GrammerStrings.grammer,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: darkOrangeColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.03,
                            vertical: size.height * 0.02,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.arrow_back_rounded,
                              ),
                              SizedBox(height: size.height * 0.05),
                              Text(
                                GrammerStrings.bannerText1,
                                style: theme.textTheme.titleLarge?.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: size.height * 0.02),
                              Text(
                                GrammerStrings.bannerText2,
                                style: theme.textTheme.titleLarge,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: SvgPicture.asset(
                            Assets.images.svg.grammerBannerImg.path),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: DefaultTabController(
                  length: 3,
                  child: SizedBox(
                    width: double.infinity,
                    child: NestedScrollView(
                      headerSliverBuilder: (context, innerBoxIsScrolled) {
                        return [
                          SliverPadding(
                            padding: EdgeInsets.only(
                              top: size.height * 0.02,
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: Text(
                              GrammerStrings.grammerCourses,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: darkBlueColor,
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          SliverPadding(
                            padding: EdgeInsets.only(top: size.height * 0.02),
                          ),
                          SliverPersistentHeader(
                            pinned: false,
                            floating: false,
                            delegate: TabBarViewDelegate(
                              tabBar: TabBar(
                                tabs: [
                                  Tab(
                                    child: Text(
                                      GrammerStrings.beginner,
                                      style:
                                          theme.textTheme.bodySmall?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: darkBlueColor,
                                      ),
                                    ),
                                  ),
                                  Tab(
                                    child: Text(
                                      GrammerStrings.intermediate,
                                      style:
                                          theme.textTheme.bodySmall?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: darkBlueColor,
                                      ),
                                    ),
                                  ),
                                  Tab(
                                    child: Text(
                                      GrammerStrings.advance,
                                      style:
                                          theme.textTheme.bodySmall?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: darkBlueColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ];
                      },
                      body: TabBarView(
                        children: [
                          AuthManager.readLevel() == 'BA' ||
                                  AuthManager.readLevel() == 'IN' ||
                                  AuthManager.readLevel() == 'AD'
                              ? BlocProvider(
                                  create: (context) => GrammerBloc()
                                    ..add(
                                      GrammerTopicsEvent(level: 'BA'),
                                    ),
                                  child: BlocBuilder<GrammerBloc, GrammerState>(
                                    builder: (context, state) {
                                      if (state is GrammerInitialState) {
                                        return Text('Please wait',
                                            style: theme.textTheme.titleLarge);
                                      }
                                      if (state is GrammerLoadingState) {
                                        return const SpinKitCircle(
                                            color: Colors.black);
                                      }
                                      if (state is GrammerTopicsResponseState) {
                                        return ListView.builder(
                                          shrinkWrap: true,
                                          itemCount:
                                              state.grammerTopicResponse.fold(
                                            (_) => 0,
                                            (grammerTopics) =>
                                                grammerTopics!.topics.length,
                                          ),
                                          itemBuilder: (context, index) {
                                            final topic =
                                                state.grammerTopicResponse.fold(
                                              (_) => '',
                                              (grammerTopics) {
                                                final topicValues =
                                                    grammerTopics?.topics.values
                                                        .toList();
                                                return '${topicValues?[index]}';
                                              },
                                            );
                                            return Padding(
                                              padding: EdgeInsets.only(
                                                  top: size.height * 0.01),
                                              child: InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) {
                                                        return BlocProvider(
                                                          create: (context) =>
                                                              GrammerBloc(),
                                                          child:
                                                              GrammerLessonScreen(
                                                            id: 'id${index + 1}',
                                                            level: 'BA',
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  );
                                                },
                                                child: CardTabBar(
                                                  color: index % 2 == 0
                                                      ? darkOrangeColor
                                                      : milkyColor,
                                                  path: Assets.images.svg
                                                      .futureSimpleImg.path,
                                                  grammerText: topic,
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      }
                                      return const Text('Error');
                                    },
                                  ),
                                )
                              : const SizedBox(),
                          AuthManager.readLevel() == 'IN' ||
                                  AuthManager.readLevel() == 'AD'
                              ? BlocProvider(
                                  create: (context) => GrammerBloc()
                                    ..add(
                                      GrammerTopicsEvent(level: 'IN'),
                                    ),
                                  child: BlocBuilder<GrammerBloc, GrammerState>(
                                    builder: (context, state) {
                                      if (state is GrammerInitialState) {
                                        return Text('Please wait',
                                            style: theme.textTheme.titleLarge);
                                      }
                                      if (state is GrammerLoadingState) {
                                        return const SpinKitCircle(
                                            color: Colors.black);
                                      }
                                      if (state is GrammerTopicsResponseState) {
                                        return ListView.builder(
                                          shrinkWrap: true,
                                          itemCount:
                                              state.grammerTopicResponse.fold(
                                            (_) => 0,
                                            (grammerTopics) =>
                                                grammerTopics!.topics.length,
                                          ),
                                          itemBuilder: (context, index) {
                                            final topic =
                                                state.grammerTopicResponse.fold(
                                              (_) => '',
                                              (grammerTopics) {
                                                final topicValues =
                                                    grammerTopics?.topics.values
                                                        .toList();
                                                return '${topicValues?[index]}';
                                              },
                                            );
                                            return Padding(
                                              padding: EdgeInsets.only(
                                                  top: size.height * 0.01),
                                              child: InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) {
                                                        return BlocProvider(
                                                          create: (context) =>
                                                              GrammerBloc(),
                                                          child:
                                                              GrammerLessonScreen(
                                                            id: 'id${index + 1}',
                                                            level: 'IN',
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  );
                                                },
                                                child: CardTabBar(
                                                  color: index % 2 == 0
                                                      ? darkOrangeColor
                                                      : milkyColor,
                                                  path: Assets.images.svg
                                                      .futureSimpleImg.path,
                                                  grammerText: topic,
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      }
                                      return const Text('Error');
                                    },
                                  ),
                                )
                              : const SizedBox(),
                          AuthManager.readLevel() == 'AD'
                              ? BlocProvider(
                                  create: (context) => GrammerBloc()
                                    ..add(
                                      GrammerTopicsEvent(level: 'AD'),
                                    ),
                                  child: BlocBuilder<GrammerBloc, GrammerState>(
                                    builder: (context, state) {
                                      if (state is GrammerInitialState) {
                                        return Text('Please wait',
                                            style: theme.textTheme.titleLarge);
                                      }
                                      if (state is GrammerLoadingState) {
                                        return const SpinKitCircle(
                                            color: Colors.black);
                                      }
                                      if (state is GrammerTopicsResponseState) {
                                        return ListView.builder(
                                          shrinkWrap: true,
                                          itemCount:
                                              state.grammerTopicResponse.fold(
                                            (_) => 0,
                                            (grammerTopics) =>
                                                grammerTopics!.topics.length,
                                          ),
                                          itemBuilder: (context, index) {
                                            final topic =
                                                state.grammerTopicResponse.fold(
                                              (_) => '',
                                              (grammerTopics) {
                                                final topicValues =
                                                    grammerTopics?.topics.values
                                                        .toList();
                                                return '${topicValues?[index]}';
                                              },
                                            );
                                            return Padding(
                                              padding: EdgeInsets.only(
                                                  top: size.height * 0.01),
                                              child: InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) {
                                                        return BlocProvider(
                                                          create: (context) =>
                                                              GrammerBloc(),
                                                          child:
                                                              GrammerLessonScreen(
                                                            id: 'id${index + 1}',
                                                            level: 'AD',
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  );
                                                },
                                                child: CardTabBar(
                                                  color: index % 2 == 0
                                                      ? darkOrangeColor
                                                      : milkyColor,
                                                  path: Assets.images.svg
                                                      .futureSimpleImg.path,
                                                  grammerText: topic,
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      }
                                      return const Text('Error');
                                    },
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TabBarViewDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;
  TabBarViewDelegate({required this.tabBar});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class CardTabBar extends StatelessWidget {
  Color color;
  String path;
  String grammerText;
  CardTabBar({
    Key? key,
    required this.color,
    required this.path,
    required this.grammerText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.12,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        child: Row(
          children: [
            SvgPicture.asset(path),
            SizedBox(width: size.width * 0.05),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    grammerText,
                    style: theme.textTheme.titleLarge?.copyWith(fontSize: 15),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
