import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green_house/features/product_details/presentaion/pages/product_details_page.dart';

import '../../../../core/util/constants.dart';
import 'expansion_tile_cart_widget.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => const ExpansionTileCartWidget(
                expansionTileTitle: 'Nvidia RTX 2080 Ti (8GB)',
              ),
              itemCount: 15,
          ),
        ],
      ),
    );
  }
}
