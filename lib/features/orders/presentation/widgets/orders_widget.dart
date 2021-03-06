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

class OrderWidget extends StatelessWidget {
  const OrderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: BlocBuilder<AppCubit,AppState>(
        builder: (context, state) => Column(
          children: [
            ConditionalBuilder(
              condition: AppCubit.get(context).myOrdersModel == null,
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
                itemBuilder: (context, index) => ExpansionTileOrderWidget(
                  expansionTileTitle: AppCubit.get(context).myOrdersModel!.data![index].items![0].itemId,
                  orderID: AppCubit.get(context).myOrdersModel!.data![index].items![0].orderId,
                  orderStatus: AppCubit.get(context).myOrdersModel!.data![index].statusId,
                  orderDate: AppCubit.get(context).myOrdersModel!.data![index].orderDate,
                ),
                itemCount: AppCubit.get(context).myOrdersModel!.data!.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
