import 'package:flutter/material.dart';
import 'package:lets_talk/ui/theme/colors.dart';

class AppMainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget icon;
  final String title;
  final Widget drawerIcon ;
  AppMainAppBar({
    required this.icon,
    required this.title,
    this.drawerIcon = const SizedBox(),
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return PreferredSize(
      preferredSize: Size(double.infinity, size.height * 0.1),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            icon,
            SizedBox(
              width: size.width * 0.07,
            ),
            Text(
              title,
              style: theme.textTheme.titleLarge
                  ?.copyWith(fontSize: 18, color: blackColor),
            ),
            const Spacer(),
            drawerIcon,
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
