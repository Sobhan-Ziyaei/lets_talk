import 'package:flutter/material.dart';
import 'package:lets_talk/ui/theme/colors.dart';

class HomeCardItem extends StatelessWidget {
  String path;
  String title;
  String subTitle;
  Color progressBarBackground;
  Color progressBarValueColor;
  HomeCardItem({
    required this.path,
    required this.title,
    required this.subTitle,
    required this.progressBarBackground,
    required this.progressBarValueColor,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    return Container(
      width: size.width * 0.3,
      height: size.height * 0.2,
      decoration: const BoxDecoration(
        color: milkyColor,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              Row(
                children: [
                  const SizedBox(width: 5),
                  Image.asset(path),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  const SizedBox(width: 10),
                  Text(
                    title,
                    style: theme.textTheme.titleSmall,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const SizedBox(width: 10),
                  Text(
                    subTitle,
                    style: theme.textTheme.bodySmall?.copyWith(
                        color: lightBlueColor, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Spacer(),
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                child: LinearProgressIndicator(
                  minHeight: 10,
                  value: 0.5,
                  backgroundColor: progressBarBackground,
                  color: progressBarValueColor,
                ),
              ),
              const SizedBox(height: 5)
            ],
          ),
        ),
      ),
    );
  }
}
