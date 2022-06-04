import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/util/widgets/back_scaffold.dart';
import '../widgets/item_display_device_details_widget.dart';
import '../widgets/product_details_widget.dart';

class ItemDisplayDeviceDetailsPage extends StatelessWidget {
  const ItemDisplayDeviceDetailsPage({
    Key? key ,
    required this.productIndex,
    required this.itemId,
  }) : super(key: key);
  final int productIndex;
  final int itemId;

  @override
  Widget build(BuildContext context) {
    return BackScaffold(
      body: ItemDisplayDeviceDetailsWidget(
        productIndex: productIndex,
        itemId: itemId,
      ),
    );
  }
}
