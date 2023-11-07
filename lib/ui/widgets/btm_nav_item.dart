import 'package:flutter/material.dart';
class BtmNavItem extends StatelessWidget {
  BtmNavItem({
    Key? key,
    required this.onPressed,
    required this.widget,
  }) : super(key: key);

  final Function() onPressed;
  final Widget widget;
  
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: widget,
    );
  }
}
