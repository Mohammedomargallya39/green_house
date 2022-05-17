import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../constants.dart';

class AssetSvg extends StatelessWidget {
  final String imagePath;
   Color? color;
   double? size;

   AssetSvg({
    Key? key,
    required this.imagePath,
     this.color = secondaryVariantRGB,
     this.size ,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/$imagePath.svg',
      color: color,
      width: size,
      height: size,
    );
  }
}
