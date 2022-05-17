import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../constants.dart';
import 'my_cupertino_indicator.dart';

class MyIndicator extends StatelessWidget {
  const MyIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MyCupertinoActivityIndicator(
        activeColor: HexColor(mainColor),
      ),
    );
  }
}
