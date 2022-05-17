import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../constants.dart';

class EmptyWidget extends StatelessWidget {
  final String text;
  final String svgImage;

  const EmptyWidget({
    Key? key,
    required this.text,
     this.svgImage = 'empty_box',

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/$svgImage.svg',
            height: 150.0,
            width: 150.0,
            color: HexColor(darkGreyColor),
          ),
          space10Vertical(context),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: HexColor(darkGreyColor),
                ),
          ),
        ],
      ),
    );
  }
}
