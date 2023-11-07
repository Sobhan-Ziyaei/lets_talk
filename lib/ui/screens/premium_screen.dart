import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lets_talk/gen/assets.gen.dart';
import 'package:lets_talk/ui/constants/app_strings.dart';
import 'package:lets_talk/ui/theme/colors.dart';
import 'package:lets_talk/ui/widgets/app_main_app_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PremiumScreen extends StatefulWidget {
  const PremiumScreen({Key? key}) : super(key: key);
  static const screenId = '/premium_screen';

  @override
  State<PremiumScreen> createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
  late PageController _pageViewController;
  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
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
          title: PremiumScreenStrings.premiumAppbarTitle,
        ),
        body: Column(
          children: [
            Expanded(
              child: SizedBox(
                height: double.infinity,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    const SizedBox(
                      height: double.infinity,
                      width: double.infinity,
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      left: 0,
                      child: Container(
                        height: 300,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              darkBlueColor,
                              lightBlueColor,
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      left: 0,
                      bottom: 60,
                      child: SvgPicture.asset(
                        Assets.images.svg.premiumBannerImg.path,
                        height: 250,
                      ),
                    ),
                    Positioned(
                      bottom: 45,
                      right: 30,
                      left: 30,
                      child: Container(
                        height: 40,
                        decoration: const BoxDecoration(
                          color: milkyColor,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          boxShadow: [
                            BoxShadow(
                              color: lightGreyColor,
                              blurRadius: 25.0,
                              spreadRadius: 1.0,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(PremiumScreenStrings.premiumTextBanner,
                                style: theme.textTheme.titleLarge),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: DefaultTabController(
                length: 2,
                child: SizedBox(
                  width: double.infinity,
                  child: NestedScrollView(
                    headerSliverBuilder: (context, innerBoxIsScrolled) {
                      return [
                        SliverPersistentHeader(
                          pinned: false,
                          floating: true,
                          delegate: TabBarViewDelegate(
                            tabBar: TabBar(
                              tabs: [
                                Tab(
                                  child: Text(
                                    PremiumScreenStrings.month3,
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: darkBlueColor,
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    PremiumScreenStrings.oneYear,
                                    style: theme.textTheme.bodySmall?.copyWith(
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
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.02,
                            vertical: size.height * 0.02,
                          ),
                          child: PageView.builder(
                            controller: _pageViewController,
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  const Spacer(),
                                  SmoothPageIndicator(
                                    controller: _pageViewController,
                                    count: 3,
                                    effect: const ExpandingDotsEffect(
                                      expansionFactor: 3,
                                      dotHeight: 10,
                                      dotWidth: 10,
                                      activeDotColor: darkBlueColor,
                                      dotColor: lightGreyColor,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.02,
                            vertical: size.height * 0.02,
                          ),
                          child: PageView.builder(
                            controller: _pageViewController,
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  const Spacer(),
                                  SmoothPageIndicator(
                                    controller: _pageViewController,
                                    count: 3,
                                    effect: const ExpandingDotsEffect(
                                      expansionFactor: 3,
                                      dotHeight: 10,
                                      dotWidth: 10,
                                      activeDotColor: darkBlueColor,
                                      dotColor: lightGreyColor,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
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
