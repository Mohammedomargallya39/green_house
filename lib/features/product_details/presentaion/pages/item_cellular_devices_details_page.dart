import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/util/widgets/back_scaffold.dart';
import '../widgets/item_cellular_devices_details_widget.dart';
import '../widgets/item_display_device_details_widget.dart';
import '../widgets/item_video_gaming_details_widget.dart';
import '../widgets/product_details_widget.dart';

class ItemCellularDevicesDetailsPage extends StatelessWidget {
  const ItemCellularDevicesDetailsPage({
    Key? key ,
    required this.productIndex,
    required this.itemId,
  }) : super(key: key);
  final int productIndex;
  final int itemId;

  @override
  Widget build(BuildContext context) {
    return BackScaffold(
      body: ItemCellularDevicesDetailsWidget(
        productIndex: productIndex,
        itemId: itemId,
      ),
    );
  }
}
