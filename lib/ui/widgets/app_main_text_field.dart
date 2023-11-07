import 'package:flutter/material.dart';
import 'package:lets_talk/gen/fonts.gen.dart';
import 'package:lets_talk/ui/constants/app_colors.dart';
import 'package:lets_talk/ui/theme/colors.dart';

class AppMainTextField extends StatelessWidget {
  final String title;
  TextEditingController controller;
  FocusNode node;

  AppMainTextField(
      {required this.title, required this.controller, required this.node});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.titleSmall?.copyWith(fontFamily: FontFamily.arSM,fontSize: 12,color: darkBlueColor,fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 5),
        TextField(
          style: theme.textTheme.titleSmall?.copyWith(color: darkBlueColor,fontSize: 12,fontWeight: FontWeight.w400),
          controller: controller,
          focusNode: node,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide.none),
            filled: true,
            fillColor: AppColors.textFieldBackground,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(
                width: 2,
                color: AppColors.blue,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
