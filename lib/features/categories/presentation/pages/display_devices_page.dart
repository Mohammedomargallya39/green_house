import 'package:flutter/cupertino.dart';
import 'package:green_house/core/util/constants.dart';
import 'package:green_house/core/util/widgets/back_scaffold.dart';
import 'package:green_house/core/util/widgets/products.dart';

class DisplayDevicesCategoryPage extends StatelessWidget {
  const DisplayDevicesCategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackScaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Products(
          image: 'assets/images/shopping.png',
          product: appTranslation(context).displayDevices,
          name: 'MSI Nvidia GTX 1660 Ti',
    ),
        )
    );
  }
}