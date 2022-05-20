import 'package:flutter/cupertino.dart';

import '../../../../core/util/constants.dart';
import '../../../../core/util/widgets/back_scaffold.dart';
import '../../../../core/util/widgets/products.dart';

class CellularDevicesCategoryPage extends StatelessWidget {
  const CellularDevicesCategoryPage ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackScaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Products(
            image: 'assets/images/shopping.png',
            product: appTranslation(context).cellularDevices,
            name: 'MSI Nvidia GTX 1660 Ti',
          ),
        )
    );
  }
}
