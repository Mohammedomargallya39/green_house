import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_house/core/util/widgets/my_button.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../core/util/constants.dart';
import '../../../../core/util/cubit/cubit.dart';
import '../../../../core/util/cubit/state.dart';

class ExpansionTileOrderWidget extends StatelessWidget {
  const ExpansionTileOrderWidget({
    Key? key,
    required this.expansionTileTitle,
  }) : super(key: key);

  final String? expansionTileTitle;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit,AppState>(
      builder: (context, state) {
        return Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            trailing: Padding(
              padding: EdgeInsets.symmetric(
              horizontal: responsiveValue(
              context,
              15.0,
            ),
            vertical: responsiveValue(
              context,
              30.0,
            ),
          ),

          child: Icon(
                AppCubit.get(context).customTileExpanded ?
                Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                color: AppCubit.get(context).isDark ?
                whiteColor.withOpacity(0.7) : blackColor,
              ),
            ),
            onExpansionChanged: (value)
            {
              AppCubit.get(context).changeCustomTileExpanded();
              AppCubit.get(context).customTileExpanded = value;
            },
            title: Row(
              children: [
                Image.asset('assets/images/market.png',
                  width: responsiveValue(
                    context,
                    100.0,
                  ),
                  height: responsiveValue(
                    context,
                    100.0,
                  ),
                ),
                space10Horizontal(context),
                Expanded(
                  child: Text(
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
                ),
              ],
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
                            '2335423',
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
                            'Pending',
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
                            '23/12/2020',
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
                            appTranslation(context).orderPoints,
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
                            '100',
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
                    // space40Vertical(context),
                    // MyButton(
                    //   onPressed: ()
                    //   {},
                    //     text: 'Order Details',
                    // ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
