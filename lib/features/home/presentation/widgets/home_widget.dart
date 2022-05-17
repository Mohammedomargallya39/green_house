import 'package:flutter/material.dart';

import '../../../../core/util/constants.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(appTranslation(context).home,),
    );
  }
}
