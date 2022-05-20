import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_house/core/util/cubit/state.dart';

import '../../../features/product_details/presentaion/pages/product_details_page.dart';
import '../constants.dart';
import '../cubit/cubit.dart';
import 'custom_delegate.dart';

class Products extends StatelessWidget {
  Products({Key? key,
    required this.product,
    required this.image,
    required this.name}
      ) : super(key: key);
  final String? product;
  final String? image;
  final String? name;



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit,AppState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: responsiveValue(
                  context,
                  10.0,
                ),
                vertical: responsiveValue(
                  context,
                  5,
                ),
              ),
              child: Text(
                product!,

                //appTranslation(context).allProducts,
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppCubit.get(context).isDark ? whiteColor.withOpacity(0.7) : blackColor,
                ),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) => InkWell(
                onTap: ()
                {
                  navigateTo(context, ProductDetailsPage());
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: responsiveValue(
                      context,
                      12.0,
                    ),
                    vertical: responsiveValue(
                      context,
                      12.0,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                          //'assets/images/shopping.png'
                        image!,
                        height: responsiveValue(
                          context,
                          100.0,
                        ),
                      ),
                      space10Vertical(context),
                      Text(
                        //'data',
                        name!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.caption?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppCubit.get(context).isDark ? whiteColor.withOpacity(0.7) : blackColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              itemCount: 33,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 8.0,
                height: responsiveValue(
                  context,
                  160.0,
                ),
              ),
            ),
          ],
        );
      },
    );

  }
}
