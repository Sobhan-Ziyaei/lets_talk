import 'package:flutter/material.dart';
import 'package:lets_talk/ui/constants/app_colors.dart';

class AppBlueButton extends StatelessWidget {
  final String title;
  final Function() onPressed;

  const AppBlueButton({required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: const MaterialStatePropertyAll(AppColors.blue),
        fixedSize:
            MaterialStatePropertyAll(Size(size.width, size.height * 0.07)),
        shape: const MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(title, style: theme.textTheme.labelMedium),
    );
  }
}
