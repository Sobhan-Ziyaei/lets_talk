import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lets_talk/gen/assets.gen.dart';
import 'package:lets_talk/ui/constants/app_strings.dart';
import 'package:lets_talk/ui/theme/colors.dart';
import 'package:lets_talk/ui/widgets/app_main_app_bar.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);
  static const screenId = '/favorite_screen';

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<String> timeFakeData = [
    'Yesterday',
    '2 Week Ago',
    '12 Oct 2023',
    '21 sep 2023',
    '10 Jun 2023',
  ];
  List<String> wordFakeData = [
    'Work',
    'Environment',
    'Weather',
    'apple',
    'Orange',
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        endDrawer: const Drawer(),
        appBar: AppMainAppBar(
          icon: InkWell(
            onTap: () => Navigator.pop(context),
            child: const SizedBox(
              width: 70,
              height: 40,
              child: Icon(Icons.arrow_back_ios_new_rounded),
            ),
          ),
          title: AppStrings.favorite,
          drawerIcon: Builder(
            builder: (context) {
              return InkWell(
                onTap: () {
                  Scaffold.of(context).openEndDrawer();
                },
                child: const Icon(Icons.menu),
              );
            },
          ),
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
                        Assets.images.svg.favoriteImg.path,
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
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.search_rounded),
                            ),
                            SizedBox(width: size.width * 0.02),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: size.height * 0.03),
                  child: CardItem(
                    widget: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.05,
                          vertical: size.height * 0.01),
                      child: Row(
                        children: [
                          Text(
                            wordFakeData[index],
                            style: theme.textTheme.titleLarge,
                          ),
                          const Spacer(),
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.bookmark,
                                  color: darkBlueColor,
                                ),
                              ),
                              Text(
                                timeFakeData[index],
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: darkBlueColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  CardItem({Key? key, required this.widget}) : super(key: key);
  Widget widget;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      decoration: const BoxDecoration(
        color: milkyColor,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: widget,
    );
  }
}
