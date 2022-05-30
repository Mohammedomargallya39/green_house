import 'package:flutter/cupertino.dart';

import '../../../../core/util/constants.dart';
import '../../../../core/util/widgets/back_scaffold.dart';
import '../../../../core/util/widgets/products.dart';

class DeskTopComputersCategoryPage extends StatelessWidget {
  const DeskTopComputersCategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackScaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Products(
            product: appTranslation(context).desktopComputers,
          ),
        )
    );
  }
}
