import 'package:flutter/cupertino.dart';

class AppText extends StatelessWidget {
  AppText({Key? key,
    required this.text,
    required this.fontFamily,
    required this.textColor,
    required this.textSize,
    required this.textWeight,
    this.textAlign,
  }) : super(key: key);
  String? text;
  String? fontFamily;
  Color? textColor;
  double? textSize;
  FontWeight? textWeight;
  TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      textAlign: textAlign,
      style: TextStyle(
        color: textColor,
        fontSize: textSize,
        fontWeight: textWeight,
        fontFamily: fontFamily,
      ),
    );
  }
}
