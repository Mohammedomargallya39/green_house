import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  DefaultButton({Key? key,
    required this.text,
    required this.fontFamily,
    required this.onPressed,
    required this.containerColor,
    required this.textColor

  }) : super(key: key);

  String? text;
  Function()? onPressed;
  Color? containerColor;
  Color? textColor;
  String? fontFamily;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: containerColor,
      ),
      child: TextButton(
          onPressed: onPressed,
          child: Text(text!,
          style: TextStyle(
            color: textColor,
            fontFamily: fontFamily,
          ),
          ),
      ),
    );
  }
}
