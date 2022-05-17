import 'package:flutter/material.dart';
import '../constants.dart';
import 'my_cupertino_indicator.dart';

class MyButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  double width;
  bool isLoading;
  Color? colorButton;
  Color? colorText;

  MyButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.width = double.infinity,
    this.isLoading = false,
    this.colorButton = mainColorRGB,
    this.colorText = whiteColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          8.0,
        ),
        color: colorButton,
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: MaterialButton(
        height: 52.0,
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.button!.copyWith(
                color: colorText
              ),
            ),
            if (isLoading) space10Horizontal(context),
            if (isLoading) const MyCupertinoActivityIndicator(),
          ],
        ),
      ),
    );
  }
}
