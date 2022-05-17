import 'package:flutter/material.dart';

class MyButtonNotProgress extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  double width;

  MyButtonNotProgress({
    Key? key,
    required this.onPressed,
    required this.text,
    this.width = double.infinity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          5.0,
        ),
        color: Theme.of(context).primaryColor,
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: MaterialButton(
        height: 52.0,
        onPressed: onPressed,
        child: Text(
          text,
          style: Theme.of(context).textTheme.button,
        ),
      ),
    );
  }
}
