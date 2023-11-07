import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lets_talk/gen/assets.gen.dart';
import 'package:lets_talk/ui/constants/app_colors.dart';
import 'package:lets_talk/ui/screens/main%20screen/activity_screen.dart';
import 'package:lets_talk/ui/screens/main%20screen/home_screen.dart';
import 'package:lets_talk/ui/screens/main%20screen/profile_screen.dart';
import 'package:lets_talk/ui/widgets/btm_nav_item.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);
  static const screenId = '/main_screen';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var btmNavHeight = size.height * 0.07;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: btmNavHeight,
              child: IndexedStack(
                index: selectedIndex,
                children: [
                  const ActivityScreen(),
                  HomeScreen(),
                  const ProfileScreen(),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                margin: EdgeInsetsDirectional.symmetric(
                  horizontal: size.height * 0.05,
                  vertical: size.height * 0.05,
                ),
                height: btmNavHeight,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.grey,
                      blurRadius: 25.0,
                      spreadRadius: 1.0,
                      offset: Offset(0, 5),
                    ),
                  ],
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  color: AppColors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BtmNavItem(
                      onPressed: () {
                        setState(() {
                          selectedIndex = 0;
                        });
                      },
                      widget: selectedIndex == 0
                          ? SvgPicture.asset(
                              Assets.images.svg.activityActiveImg.path)
                          : SvgPicture.asset(
                              Assets.images.svg.activityInactiveImg.path,
                            ),
                    ),
                    BtmNavItem(
                      onPressed: () {
                        setState(() {
                          selectedIndex = 1;
                        });
                      },
                      widget: selectedIndex == 1
                          ? SvgPicture.asset(
                              Assets.images.svg.homeActiveImg.path)
                          : SvgPicture.asset(
                              Assets.images.svg.homeInactiveImg.path,
                            ),
                    ),
                    BtmNavItem(
                      onPressed: () {
                        setState(() {
                          selectedIndex = 2;
                        });
                      },
                      widget: selectedIndex == 2
                          ? SvgPicture.asset(
                              Assets.images.svg.profileActiveImg.path)
                          : SvgPicture.asset(
                              Assets.images.svg.profileInactiveImg.path,
                            ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
