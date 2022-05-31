import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:green_house/core/util/cubit/state.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../core/util/constants.dart';
import '../../../../core/util/cubit/cubit.dart';
import '../../../../core/util/widgets/custom_delegate.dart';
import '../../../product_details/presentaion/pages/product_details_page.dart';


class VideoGamingItemsScreen extends StatelessWidget {
  const VideoGamingItemsScreen({Key? key,}
      ) : super(key: key);


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
                appTranslation(context).videoGaming,

                //appTranslation(context).allProducts,
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppCubit.get(context).isDark ? whiteColor.withOpacity(0.7) : blackColor,
                ),
              ),
            ),
            ConditionalBuilder(
              condition: AppCubit.get(context).videoGamingItemModel != null,
              builder: (context) => GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => InkWell(
                  onTap: ()
                  {
                    navigateTo(context, ProductDetailsPage(
                      productIndex: index,
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
                          AppCubit.get(context).videoGamingItemModel![index].image!,
                          height: responsiveValue(
                            context,
                            100.0,
                          ),
                        ),
                        space10Vertical(context),
                        Text(
                          AppCubit.get(context).videoGamingItemModel![index].name!,
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
                itemCount: AppCubit.get(context).videoGamingItemModel!.length,
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
          ],
        );
      },
    );

  }
}
