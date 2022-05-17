import 'package:flutter/material.dart';

class DefaultTextButton extends StatelessWidget {
  DefaultTextButton({Key? key,
    required this.text,
    required this.fontFamily,
    required this.onPressed,
    required this.textColor,
    required this.fontSize,
  }) : super(key: key);

  Function()? onPressed;
  String? text;
  String? fontFamily;
  Color? textColor;
  double? fontSize;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(text!,
        style: TextStyle(
          color: textColor,
          fontSize: fontSize,
          fontFamily: fontFamily,
        )
        ),
    );
  }
}
