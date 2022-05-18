import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../constants.dart';

class MyTextButton extends StatelessWidget {
  final String title;
  final Function() onTap;
  final TextStyle style;

  const MyTextButton({
    Key? key,
    required this.title,
    required this.onTap,
    required this.style
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        title,
        style: style
      ),
    );
  }
}
