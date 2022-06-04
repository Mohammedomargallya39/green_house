import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:green_house/core/util/cubit/state.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../features/product_details/presentaion/pages/product_details_page.dart';
import '../constants.dart';
import '../cubit/cubit.dart';
import 'custom_delegate.dart';

class Products extends StatelessWidget {
  const Products({Key? key,
    required this.product,}
      ) : super(key: key);
  final String? product;


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit,AppState>(
      builder: (context, state) {
        return  Column(
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
            ConditionalBuilder(
              condition: state is UserItemsLoading,
              builder: (context) => Padding(
              padding: EdgeInsets.symmetric(
                   vertical: responsiveValue(
                             context,
                             150.0,
                   ),
              ),
              child: Center(
                    child: CircularProgressIndicator(
                           color: HexColor(greenColor),
                    )

              ),
              ),
              fallback: (context) => ConditionalBuilder(
                condition: AppCubit.get(context).itemModel != null,
                builder: (context) => ConditionalBuilder(
                  condition: AppCubit.get(context).itemModel!.data != null,
                  builder: (context) => GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => InkWell(
                      onTap: ()
                      {
                        navigateTo(context, ProductDetailsPage(
                          productIndex: index,
                          itemId: AppCubit.get(context).itemModel!.data![index].id!,
                        ));
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
                            Image.network(
                              AppCubit.get(context).itemModel!.data![index].image!,
                              height: responsiveValue(
                                context,
                                100.0,
                              ),
                            ),
                            space10Vertical(context),
                            Text(
                              AppCubit.get(context).itemModel!.data![index].name!,
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
                    itemCount: AppCubit.get(context).itemModel!.data!.length,
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
                  fallback: (context) => Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: responsiveValue(
                        context,
                        150.0,
                      ),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/images/empty_box.svg',
                        color: HexColor(greenColor),
                        height: responsiveValue(
                          context,
                          200.0,
                        ),
                        width: responsiveValue(
                          context,
                          200.0,
                        ),
                      ),
                    ),
                  ),
                ),
                fallback: (context) => Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: responsiveValue(
                      context,
                      150.0,
                    ),
                  ),
                  child: Center(
                      child: CircularProgressIndicator(
                        color: HexColor(greenColor),
                      )

                  ),
                ),
              ),
            ),
          ],
        );
      },
    );

  }
}
