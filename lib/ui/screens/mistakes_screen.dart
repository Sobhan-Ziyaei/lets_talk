import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:lets_talk/gen/assets.gen.dart';
import 'package:lets_talk/ui/constants/app_strings.dart';
import 'package:lets_talk/ui/theme/colors.dart';
import 'package:lets_talk/ui/widgets/app_main_app_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MistakesScreen extends StatefulWidget {
  MistakesScreen({Key? key}) : super(key: key);
  static const screenId = '/mistakes_screen';

  @override
  State<MistakesScreen> createState() => _MistakesScreenState();
}

class _MistakesScreenState extends State<MistakesScreen> {
  late PageController _pageViewController;
  List<String> pathImage = [
    Assets.images.png.travelImage.path,
    Assets.images.png.pharmacyImage.path,
    Assets.images.png.hotelImage.path,
    Assets.images.png.travelImage.path,
    Assets.images.png.pharmacyImage.path,
  ];
  List<String> titleName = [
    'Travel',
    'Pharmacy',
    'Hotel',
    'Travel',
    'Pharmacy',
  ];

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
          title: MistakesStrings.mistakesTitle,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: EasyDateTimeLine(
                  headerProps: const EasyHeaderProps(
                    selectedDateFormat: SelectedDateFormat.fullDateDMY,
                    monthStyle: TextStyle(
                      color: darkBlueColor,
                    ),
                  ),
                  initialDate: DateTime.now(),
                  activeColor: darkBlueColor,
                  onDateChange: (selectedDate) {},
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      MistakesStrings.mainTitle,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: darkBlueColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: size.height * 0.05),
                    SizedBox(
                      height: size.height * 0.15,
                      child: ListView.builder(
                        itemCount: 5,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                              right: index == 0
                                  ? size.width * 0.05
                                  : size.width * 0.03,
                            ),
                            child: CardItem(
                              title: titleName[index],
                              path: pathImage[index],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
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
                                      AppStrings.mistakes,
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
                                      FormStrings.warning,
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
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SliderItem(
                                          color: darkBlueColor,
                                          text: MistakesStrings.doctor,
                                          backgroundColor: milkyColor,
                                        ),
                                        SliderItem(
                                          color: darkBlueColor,
                                          text: MistakesStrings.mexican,
                                          backgroundColor: milkyColor,
                                        ),
                                        SliderItem(
                                          color: darkBlueColor,
                                          text: MistakesStrings.hello,
                                          backgroundColor: milkyColor,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: size.height * 0.03),
                                    Row(
                                      children: [
                                        SliderItem(
                                          color: darkBlueColor,
                                          text: MistakesStrings.nurse,
                                          backgroundColor: lightOrangeColor,
                                        ),
                                      ],
                                    ),
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
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SliderItem(
                                          color: darkBlueColor,
                                          text: MistakesStrings.doctor,
                                          backgroundColor: milkyColor,
                                        ),
                                        SliderItem(
                                          color: darkBlueColor,
                                          text: MistakesStrings.mexican,
                                          backgroundColor: milkyColor,
                                        ),
                                        SliderItem(
                                          color: darkBlueColor,
                                          text: MistakesStrings.hello,
                                          backgroundColor: milkyColor,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: size.height * 0.03),
                                    Row(
                                      children: [
                                        SliderItem(
                                          color: darkBlueColor,
                                          text: MistakesStrings.nurse,
                                          backgroundColor: lightOrangeColor,
                                        ),
                                      ],
                                    ),
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

class SliderItem extends StatelessWidget {
  String text;
  Color color;
  Color backgroundColor;
  SliderItem(
      {Key? key,
      required this.color,
      required this.text,
      required this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    return Container(
      width: size.width * 0.25,
      height: size.height * 0.05,
      decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(width: 1, color: milkyColor),
          borderRadius: BorderRadius.circular(5)),
      child: Center(
        child: Text(
          text,
          style: theme.textTheme.bodySmall?.copyWith(
            color: color,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  String title;
  String path;
  CardItem({Key? key, required this.title, required this.path})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.25,
      height: size.height * 0.15,
      decoration: BoxDecoration(
        color: milkyColor,
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(path),
          Text(
            title,
            style: theme.textTheme.bodySmall?.copyWith(
                color: darkBlueColor,
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
