import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import '../constants.dart';
import '../cubit/cubit.dart';
import '../cubit/state.dart';
import 'asset_svg.dart';

class MyThemeIcon extends StatelessWidget {
  final String path;
  final String lightColor;
  final String darkColor;

  const MyThemeIcon({
    Key? key,
    this.lightColor = mainColor,
    this.darkColor = regularGrey,
    required this.path,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return AssetSvg(
          color: AppCubit.get(context).isDark ? HexColor(darkColor) : HexColor(lightColor),
          imagePath: path,
        );
      },
    );
  }
}