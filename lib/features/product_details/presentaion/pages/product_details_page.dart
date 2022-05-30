import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/util/widgets/back_scaffold.dart';
import '../widgets/product_details_widget.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({Key? key , required this.productIndex}) : super(key: key);
  final int productIndex;

  @override
  Widget build(BuildContext context) {
    return BackScaffold(
      body: ProductDetailsWidget(productIndex: productIndex,),
    );
  }
}
