import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:green_house/core/util/cubit/cubit.dart';
import 'package:green_house/core/util/cubit/state.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../core/util/constants.dart';
import 'expansion_tile_orders_widget.dart';
import 'expantion_tile_order_details_widget.dart';

class OrderDetailsWidget extends StatefulWidget {
  const OrderDetailsWidget({
    Key? key,
    required this.orderID,
  }) : super(key: key);
  final String? orderID;

  @override
  State<OrderDetailsWidget> createState() => _OrderDetailsWidgetState();
}

class _OrderDetailsWidgetState extends State<OrderDetailsWidget> {

  @override
  initState() {
    super.initState();
    AppCubit.get(context).getOrderDetails(orderId: widget.orderID!);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: BlocBuilder<AppCubit,AppState>(
        builder: (context, state) => Column(
          children: [
            ConditionalBuilder(
              condition: AppCubit.get(context).orderDetailsModel == null,
              builder: (context) => Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: responsiveValue(
                      context,
                      150.0,
                    ),
                  ),
                  child: SvgPicture.asset(
                    'assets/images/empty_box.svg',
                    color: HexColor(greenColor),
                    height: responsiveValue(
                      context,
                      300.0,
                    ),
                    width: responsiveValue(
                      context,
                      300.0,
                    ),
                  ),
                ),
              ),
              fallback: (context) => ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => ExpansionTileOrderDetailsWidget(
                  expansionTileTitle: AppCubit.get(context).orderDetailsModel!.data![index].itemId,
                  orderID: AppCubit.get(context).orderDetailsModel!.data![index].orderId,
                  productPoints: AppCubit.get(context).orderDetailsModel!.data![index].pointsDone,
                  quantity: AppCubit.get(context).orderDetailsModel!.data![index].quantity,
                ),
                itemCount: AppCubit.get(context).orderDetailsModel!.data!.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
