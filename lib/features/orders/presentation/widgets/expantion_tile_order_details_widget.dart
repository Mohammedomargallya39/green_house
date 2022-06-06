import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_house/core/util/widgets/my_button.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../core/util/constants.dart';
import '../../../../core/util/cubit/cubit.dart';
import '../../../../core/util/cubit/state.dart';

class ExpansionTileOrderDetailsWidget extends StatelessWidget {
  const ExpansionTileOrderDetailsWidget({
    Key? key,
    required this.expansionTileTitle,
    required this.orderID,
    required this.quantity,
    required this.productPoints,

  }) : super(key: key);

  final String? expansionTileTitle;
  final String? orderID;
  final String? quantity;
  final String? productPoints;

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
                              appTranslation(context).quantity,
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
                              quantity!,
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
                              appTranslation(context).productPoints,
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
                              productPoints!,
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
