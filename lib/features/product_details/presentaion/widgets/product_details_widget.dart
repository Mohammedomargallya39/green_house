import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_house/core/util/constants.dart';
import 'package:green_house/core/util/cubit/state.dart';
import 'package:green_house/core/util/widgets/my_button.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../core/util/cubit/cubit.dart';

class ProductDetailsWidget extends StatelessWidget {
  const ProductDetailsWidget({Key? key}) : super(key: key);

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
                Image.asset(
                  'assets/images/shopping.png',
                  height: 280,
                  width: double.infinity,
                ),
                bigDivider(context),
                space20Vertical(context),
                Row(
                  children: [
                    Text(
                      'Data',
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppCubit.get(context).isDark ? whiteColor.withOpacity(0.7) : blackColor,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '550 ${appTranslation(context).productPoints}',
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppCubit.get(context).isDark ? whiteColor.withOpacity(0.7) : blackColor,
                      ),
                    ),
                  ],
                ),
                space20Vertical(context),
                Text(
                  'Product Description Product DescriptionProduct Product Description Product DescriptionProduct Product Description Product DescriptionProduct ',
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppCubit.get(context).isDark ? whiteColor.withOpacity(0.7) : blackColor,
                  ),
                ),
                space40Vertical(context),
                Row(
                  children: [
                    Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        IconButton(
                          onPressed: ()
                          {

                          },
                          icon: Icon(
                            Icons.shopping_cart,
                            color: mainColorRGB,
                            size: responsiveValue(
                              context,
                              20,
                            ),
                          ),
                        ),
                        Container(

                          decoration: BoxDecoration(
                            color: HexColor(red),
                            borderRadius: BorderRadius.circular(
                              responsiveValue(
                                context,
                                15.0,
                              ),
                            ),
                          ),
                          child: Text(
                              '55',
                            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                              fontWeight: FontWeight.w400,
                              color: whiteColor,
                            ),
                          ),
                        )
                      ],
                    ),
                    space8Horizontal(context),
                    Expanded(
                      flex: 2,
                      child: MyButton(
                        onPressed: (){},
                        text: appTranslation(context).addToCart,
                      ),
                    ),
                    space8Horizontal(context),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: mainColorRGB.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(
                            responsiveValue(
                              context,
                              8.0,
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: IconButton(
                                  onPressed: ()
                                  {
                                    AppCubit.get(context).counterPlus();
                                  },
                                  icon: const Icon(
                                      Icons.add,
                                      color: mainColorRGB,
                                  ),
                              ),
                            ),
                            Expanded(
                                child: Center(
                                  child: Text(
                                    AppCubit.get(context).numOfProducts.toString(),
                                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: mainColorRGB,
                                      ),
                                  ),
                                ),
                            ),
                            Expanded(
                              child: IconButton(
                                onPressed: ()
                                {
                                  AppCubit.get(context).counterMin();
                                },
                                icon: const Icon(
                                  Icons.remove,
                                  color: mainColorRGB,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
