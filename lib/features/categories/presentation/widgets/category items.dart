import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_house/core/util/cubit/state.dart';
import '../../../../core/util/constants.dart';
import '../../../../core/util/cubit/cubit.dart';
import '../../../../core/util/widgets/custom_delegate.dart';
import '../../../product_details/presentaion/pages/product_details_page.dart';

class CategoryItems extends StatelessWidget {
  CategoryItems({Key? key,
    required this.categoryTitle,
    required this.productImage,
    required this.productName,
    required this.function,

  }) : super(key: key);
  final String categoryTitle;
  final String productImage;
  final String productName;
  final Function() function;


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit,AppState>(
      builder: (context, state) {
        return Column(
          children: [
            space20Vertical(context),
            // make these widgets clean
            Row(
              children: [
                Text(
                  categoryTitle,
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppCubit.get(context).isDark ? whiteColor.withOpacity(0.7) : blackColor,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: function,
                  child: Row(
                    children: [
                      Text(
                        appTranslation(context).viewAll,
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppCubit.get(context).isDark ? whiteColor.withOpacity(0.7) : blackColor,
                        ),
                      ),
                      space10Horizontal(context),
                      Icon(
                        AppCubit.get(context).isRtl ? Icons.arrow_circle_left_outlined:
                        Icons.arrow_circle_right_outlined,
                        color: AppCubit.get(context).isDark ? whiteColor : blackColor,
                      ),
                    ],
                  ),
                )
              ],
            ),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) => InkWell(
                onTap: ()
                {
                  // navigateTo(context, ProductDetailsPage());
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
                        productImage
                          //'assets/images/shopping.png'
                      ),
                      space10Vertical(context),
                      Text(
                        productName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.caption?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppCubit.get(context).isDark ? whiteColor.withOpacity(0.7) : blackColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              itemCount: 3,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                crossAxisCount: 3,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 8.0,
                height: responsiveValue(
                  context,
                  150.0,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
