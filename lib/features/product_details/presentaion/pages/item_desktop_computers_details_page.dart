import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/util/widgets/back_scaffold.dart';
import '../widgets/item_desktop_computer_details_widget.dart';
import '../widgets/product_details_widget.dart';

class ItemDesktopComputerDetailsPage extends StatelessWidget {
  const ItemDesktopComputerDetailsPage({
    Key? key ,
    required this.productIndex,
    required this.itemId,
  }) : super(key: key);
  final int productIndex;
  final int itemId;

  @override
  Widget build(BuildContext context) {
    return BackScaffold(
      body: ItemDesktopComputerDetailsWidget(
        productIndex: productIndex,
        itemId: itemId,
      ),
    );
  }
}
