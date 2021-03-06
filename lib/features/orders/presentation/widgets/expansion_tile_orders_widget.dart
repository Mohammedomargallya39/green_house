import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_house/core/util/widgets/my_button.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../core/util/constants.dart';
import '../../../../core/util/cubit/cubit.dart';
import '../../../../core/util/cubit/state.dart';
import '../pages/order_details_page.dart';

class ExpansionTileOrderWidget extends StatelessWidget {
  const ExpansionTileOrderWidget({
    Key? key,
    required this.expansionTileTitle,
    required this.orderID,
    required this.orderStatus,
    required this.orderDate,
    //required this.index,
  }) : super(key: key);

  final String? expansionTileTitle;
  final String? orderID;
  final String? orderStatus;
  final String? orderDate;
  //final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit,AppState>(
      builder: (context, state) {
        return Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: responsiveValue(
                context,
                10.0,
              ),
            ),
            child: ExpansionTile(
              trailing: Icon(
                    AppCubit.get(context).customTileExpanded ?
                    Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                    color: AppCubit.get(context).isDark ?
                    whiteColor.withOpacity(0.7) : blackColor,
                  ),
              onExpansionChanged: (value)
              {
                AppCubit.get(context).changeCustomTileExpanded();
                AppCubit.get(context).customTileExpanded = value;
              },
              title: Text(
                expansionTileTitle!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.caption!.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: responsiveValue(
                    context,
                    16.0,
                  ),
                  color: AppCubit.get(context).isDark ? whiteColor.withOpacity(0.7) : blackColor,
                ),
              ),
              children: [
                ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      space10Vertical(context),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              appTranslation(context).orderNumber,
                              style: Theme.of(context).textTheme.caption!.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: responsiveValue(
                                  context,
                                  18.0,
                                ),
                                color: AppCubit.get(context).isDark ? whiteColor.withOpacity(0.7) : blackColor,
                              ),
                            ),
                          ),
                          space10Horizontal(context),
                          Expanded(
                            child: Text(
                              orderID!,
                              style: Theme.of(context).textTheme.caption!.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: responsiveValue(
                                  context,
                                  18.0,
                                ),
                                color: HexColor(greenColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                      space20Vertical(context),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              appTranslation(context).orderStatus,
                              style: Theme.of(context).textTheme.caption!.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: responsiveValue(
                                  context,
                                  18.0,
                                ),
                                color: AppCubit.get(context).isDark ? whiteColor.withOpacity(0.7) : blackColor,
                              ),
                            ),
                          ),
                          space10Horizontal(context),
                          Expanded(
                            child: Text(
                              orderStatus!,
                              style: Theme.of(context).textTheme.caption!.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: responsiveValue(
                                  context,
                                  18.0,
                                ),
                                color: HexColor(greenColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                      space20Vertical(context),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              appTranslation(context).orderDate,
                              style: Theme.of(context).textTheme.caption!.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: responsiveValue(
                                  context,
                                  18.0,
                                ),
                                color: AppCubit.get(context).isDark ? whiteColor.withOpacity(0.7) : blackColor,
                              ),
                            ),
                          ),
                          space10Horizontal(context),
                          Expanded(
                            child: Text(
                              orderDate!,
                              style: Theme.of(context).textTheme.caption!.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: responsiveValue(
                                  context,
                                  18.0,
                                ),
                                color: HexColor(greenColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                      space20Vertical(context),
                      MyButton(
                          onPressed: ()
                          {
                            navigateTo(context, OrderDetailsPage(
                              orderID: orderID!,
                            ));
                          },
                          text: appTranslation(context).orderDetails,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
