import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:green_house/core/util/constants.dart';
import 'package:green_house/core/util/cubit/state.dart';
import 'package:green_house/core/util/widgets/my_button.dart';
import '../../../../core/util/cubit/cubit.dart';

class ItemVideoGamingDetailsWidget extends StatelessWidget {
  const ItemVideoGamingDetailsWidget({
    Key? key ,
    required this.productIndex,
    required this.itemId,
  }) : super(key: key);
  final int productIndex;
  final int itemId;


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(
      listener: (context, state) {
        if (state is AddCartItemsSuccess)
        {
          Fluttertoast.showToast(
            msg: appTranslation(context).addToCartSuccessfully,
          );
        }
      },
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
                  AppCubit.get(context).videoGamingItemModel![productIndex].image!,
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
                        AppCubit.get(context).videoGamingItemModel![productIndex].name!,
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
                        AppCubit.get(context).videoGamingItemModel![productIndex].categoryId!,
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
                        AppCubit.get(context).videoGamingItemModel![productIndex].description!,
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
                        AppCubit.get(context).videoGamingItemModel![productIndex].vedioUrl! != ''?
                        AppCubit.get(context).videoGamingItemModel![productIndex].vedioUrl! :
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
                    AppCubit.get(context).addCart(
                        itemId: itemId
                    );
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