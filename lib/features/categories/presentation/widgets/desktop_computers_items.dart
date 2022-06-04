import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:green_house/core/util/cubit/state.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../core/util/constants.dart';
import '../../../../core/util/cubit/cubit.dart';
import '../../../../core/util/widgets/custom_delegate.dart';
import '../../../product_details/presentaion/pages/item_desktop_computers_details_page.dart';
import '../../../product_details/presentaion/pages/product_details_page.dart';

class DesktopComputersItems extends StatelessWidget {
  const DesktopComputersItems({Key? key,
    required this.categoryTitle,
    required this.function,

  }) : super(key: key);
  final String categoryTitle;
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

            ConditionalBuilder(
              condition: state is DisplayDevicesItemsLoading,
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
                // ignore: unnecessary_null_comparison
                condition: AppCubit.get(context).desktopComputersItemModel! != null,
                builder: (context) => GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => InkWell(
                    onTap: ()
                    {
                      navigateTo(context, ItemDesktopComputerDetailsPage(
                        itemId: AppCubit.get(context).desktopComputersItemModel![index].id!,
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
                            AppCubit.get(context).desktopComputersItemModel![index].image!,
                            //'assets/images/shopping.png'
                          ),
                          space10Vertical(context),
                          Text(
                            AppCubit.get(context).desktopComputersItemModel![index].name!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.caption?.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppCubit.get(context).isDark ? whiteColor.withOpacity(0.7) : blackColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  itemCount: AppCubit.get(context).desktopComputersItemModel!.length,

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
            ),

          ],
        );
      },
    );
  }
}
