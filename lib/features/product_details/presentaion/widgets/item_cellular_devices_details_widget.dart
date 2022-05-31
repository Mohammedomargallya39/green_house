import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_house/core/util/constants.dart';
import 'package:green_house/core/util/cubit/state.dart';
import 'package:green_house/core/util/widgets/my_button.dart';
import '../../../../core/util/cubit/cubit.dart';

class ItemCellularDevicesDetailsWidget extends StatelessWidget {
  const ItemCellularDevicesDetailsWidget({Key? key , required this.productIndex}) : super(key: key);
  final int productIndex;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit,AppState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: responsiveValue(
              context,
              16.0,
            ),
            vertical: responsiveValue(
              context,
              12.0,
            ),
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  AppCubit.get(context).cellularItemModel![productIndex].image!,
                  height: 280,
                  width: double.infinity,
                ),
                bigDivider(context),
                space20Vertical(context),
                Row(
                  children: [
                    Expanded(

                      child: Text(
                        '${appTranslation(context).productName}: ',
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppCubit.get(context).isDark ? whiteColor.withOpacity(0.7) : blackColor,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        AppCubit.get(context).cellularItemModel![productIndex].name!,
                        textAlign: AppCubit
                            .get(context)
                            .isRtl ? TextAlign.end : TextAlign.start,
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppCubit.get(context).isDark ? whiteColor.withOpacity(0.7) : blackColor,
                        ),
                      ),
                    ),
                  ],
                ),
                space20Vertical(context),
                myDivider(context),
                space20Vertical(context),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        '${appTranslation(context).productCategory}: ',
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppCubit.get(context).isDark ? whiteColor.withOpacity(0.7) : blackColor,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        AppCubit.get(context).cellularItemModel![productIndex].categoryId!,
                        textAlign: AppCubit
                            .get(context)
                            .isRtl ? TextAlign.end : TextAlign.start,
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppCubit.get(context).isDark ? whiteColor.withOpacity(0.7) : blackColor,
                        ),
                      ),
                    ),
                  ],
                ),
                space20Vertical(context),
                myDivider(context),
                space20Vertical(context),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        '${appTranslation(context).productDescription}: ',
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppCubit.get(context).isDark ? whiteColor.withOpacity(0.7) : blackColor,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        AppCubit.get(context).cellularItemModel![productIndex].description!,
                        textAlign: AppCubit
                            .get(context)
                            .isRtl ? TextAlign.end : TextAlign.start,
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppCubit.get(context).isDark ? whiteColor.withOpacity(0.7) : blackColor,
                        ),
                      ),
                    ),
                  ],
                ),
                space20Vertical(context),
                myDivider(context),
                space20Vertical(context),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        '${appTranslation(context).productVideoUrl}: ',
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppCubit.get(context).isDark ? whiteColor.withOpacity(0.7) : blackColor,
                        ),
                      ),
                    ),
                    Expanded(
                      child: SelectableText(
                        AppCubit.get(context).cellularItemModel![productIndex].vedioUrl! != ''?
                        AppCubit.get(context).cellularItemModel![productIndex].vedioUrl! :
                        appTranslation(context).notAvailable,
                        textAlign: AppCubit
                            .get(context)
                            .isRtl ? TextAlign.end : TextAlign.start,
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppCubit.get(context).isDark ? whiteColor.withOpacity(0.7) : blackColor,
                        ),
                      ),
                    ),
                  ],
                ),
                space20Vertical(context),
                myDivider(context),

                space40Vertical(context),
                MyButton(
                  onPressed: ()
                  {

                  },
                  text: appTranslation(context).addToCart,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}