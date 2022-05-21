import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'expansion_tile_orders_widget.dart';

class OrderWidget extends StatelessWidget {
  const OrderWidget({Key? key}) : super(key: key);

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
              itemBuilder: (context, index) => const ExpansionTileOrderWidget(
                expansionTileTitle: 'Nvidia RTX 2080 Ti (8GB)',
              ),
              itemCount: 15,
          ),
        ],
      ),
    );
  }
}
