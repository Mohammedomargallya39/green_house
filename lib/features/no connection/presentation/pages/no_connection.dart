import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../core/util/constants.dart';
import '../../../../core/util/widgets/home_scaffold.dart';



class NoConnectionPage extends StatelessWidget {
  const NoConnectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      widget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
                'assets/images/no_connection.png',
                color: HexColor(mainColor),
                height: responsiveValue(context, 200),
                width: responsiveValue(context, 200),
            ),
          ),
        ],
      ),
    );
  }
}
