import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lets_talk/ui/constants/app_colors.dart';
import 'package:lets_talk/ui/theme/colors.dart';

class ChooseRoleCard extends StatelessWidget {
  String path;
  String text;
  ChooseRoleCard({required this.path, required this.text});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    return Container(
      width: size.width * 0.2,
      height: size.height * 0.20,
      decoration: const BoxDecoration(
        color: milkyColor,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(path),
            const Spacer(),
            Text(
              text,
              style: theme.textTheme.titleSmall?.copyWith(
                  color: darkBlueColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w700),
            ),
            const Spacer(),
            const Row(
              children: [
                Icon(Icons.star, color: AppColors.yellow),
                Icon(Icons.star, color: AppColors.yellow),
                Icon(Icons.star_border, color: AppColors.blue),
                Icon(Icons.star_border, color: AppColors.blue),
                Icon(Icons.star_border, color: AppColors.blue),
              ],
            ),
            SizedBox(height: size.height * 0.01),
          ],
        ),
      ),
    );
  }
}
