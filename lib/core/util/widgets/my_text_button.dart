import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../constants.dart';

class MyTextButton extends StatelessWidget {
  final String title;
  final Function() onTap;

  const MyTextButton({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        title,
        style: Theme.of(context).textTheme.subtitle1!.copyWith(
              color: HexColor(mainColor),
              fontWeight: FontWeight.w700,
            ),
      ),
    );
  }
}
