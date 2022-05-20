import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green_house/core/util/constants.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../core/util/widgets/back_scaffold.dart';
import '../widgets/product_details_widget.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackScaffold(
      body: ProductDetailsWidget(),
    );
  }
}
