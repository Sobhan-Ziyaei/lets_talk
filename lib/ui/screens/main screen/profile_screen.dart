import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lets_talk/gen/assets.gen.dart';
import 'package:lets_talk/ui/constants/app_strings.dart';
import 'package:lets_talk/ui/screens/auth/login_screen.dart';
import 'package:lets_talk/ui/screens/premium_screen.dart';
import 'package:lets_talk/ui/theme/colors.dart';
import 'package:lets_talk/util/auth_manager.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.07,
                vertical: size.height * 0.05,
              ),
              child: Column(
                children: [
                  getContainer(
                    widget: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.03,
                          vertical: size.height * 0.03),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                ProfileStrings.name,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: darkBlueColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                ProfileStrings.sampleName,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: darkBlueColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(width: size.width * 0.08),
                            ],
                          ),
                          SizedBox(height: size.height * 0.02),
                          const Divider(
                            color: darkGreyColor,
                          ),
                          SizedBox(height: size.height * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                ProfileStrings.englishLevel,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: darkBlueColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    ProfileStrings.basic,
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: darkBlueColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.arrow_right_rounded),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: size.height * 0.02),
                          const Divider(
                            color: darkGreyColor,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                ProfileStrings.subsciption,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: darkBlueColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.arrow_right_rounded),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  InkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, PremiumScreen.screenId),
                    child: Container(
                      decoration: BoxDecoration(
                        color: lightOrangeColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.03,
                            vertical: size.height * 0.02),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              ProfileStrings.takePremiumAccount,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: lightBlueColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SvgPicture.asset(Assets.images.svg.diamondImg.path),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Container(
                    decoration: BoxDecoration(
                      color: mediumBlueColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.03,
                          vertical: size.height * 0.01),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            ProfileStrings.invite,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: whiteColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SvgPicture.asset(Assets.images.svg.inviteImg.path),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.04),
                  Row(
                    children: [
                      Text(
                        ProfileStrings.setting,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: darkBlueColor,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: size.height * 0.03),
                  getContainer(
                    widget: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.03,
                          vertical: size.height * 0.03),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                ProfileStrings.setNotif,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: darkBlueColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.arrow_right_rounded),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.02),
                          const Divider(
                            color: darkGreyColor,
                          ),
                          SizedBox(height: size.height * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                ProfileStrings.schedule,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: darkBlueColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.arrow_right_rounded),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.02),
                          const Divider(
                            color: darkGreyColor,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  AuthManager.logout();
                                  Navigator.pushNamed(context, LoginScreen.screenId);
                                },
                                child: Text(
                                  ProfileStrings.logOut,
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: lightOrangeColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Row(
                    children: [
                      Text(
                        ProfileStrings.contact,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: darkBlueColor,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.03),
                  getContainer(
                    widget: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.03,
                          vertical: size.height * 0.03),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                ProfileStrings.helpCenter,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: darkBlueColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.arrow_right_rounded),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.02),
                          const Divider(
                            color: darkGreyColor,
                          ),
                          SizedBox(height: size.height * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                ProfileStrings.contactUs,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: darkBlueColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.arrow_right_rounded),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.02),
                          const Divider(
                            color: darkGreyColor,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                ProfileStrings.report,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: darkBlueColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.arrow_right_rounded),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.02),
                          const Divider(
                            color: darkGreyColor,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                ProfileStrings.privacy,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: darkBlueColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.arrow_right_rounded),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class getContainer extends StatelessWidget {
  getContainer({Key? key, required this.widget}) : super(key: key);
  Widget widget;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: milkyColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: widget,
    );
  }
}
