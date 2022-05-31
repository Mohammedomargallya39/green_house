import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/util/widgets/back_scaffold.dart';
import '../widgets/item_display_device_details_widget.dart';
import '../widgets/item_video_gaming_details_widget.dart';
import '../widgets/product_details_widget.dart';

class ItemVideoGamingDetailsPage extends StatelessWidget {
  const ItemVideoGamingDetailsPage({Key? key , required this.productIndex}) : super(key: key);
  final int productIndex;

  @override
  Widget build(BuildContext context) {
    return BackScaffold(
      body: ItemVideoGamingDetailsWidget(productIndex: productIndex,),
    );
  }
}
