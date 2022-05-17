import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/util/constants.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(appTranslation(context).categories,),
    );
  }
}
