import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyArrow extends StatelessWidget {
  const MyArrow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: .6,
      child: RotatedBox(
        quarterTurns: Directionality.of(context) ==
            TextDirection.rtl
            ? 0
            : 2,
        child: SvgPicture.asset(
          'assets/images/arrow.svg',
        ),
      ),
    );
  }
}
