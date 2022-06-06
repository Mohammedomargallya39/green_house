import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:green_house/core/util/cubit/cubit.dart';
import 'package:green_house/core/util/cubit/state.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../core/util/constants.dart';
import '../../../../core/util/widgets/my_button.dart';
import 'expansion_tile_cart_widget.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit.get(context).getCart();
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: BlocConsumer<AppCubit,AppState>(
        listener: (context, state) {
          if(state is MakeOrderSuccess)
          {
            Fluttertoast.showToast(
                msg: appTranslation(context).madeOrderSuccessfully
            );
          }
        },
        builder: (context, state) => Padding(
          padding: EdgeInsets.symmetric(
            horizontal: responsiveValue(
              context,
              20.0,
            ),
          ),
          child: ConditionalBuilder(
            condition: state is GetCartLoading,
            builder: (context) => Padding(
              padding: EdgeInsets.symmetric(
                vertical: responsiveValue(
                  context,
                  300
                ),
              ),
              child: Center(
                  child: CircularProgressIndicator(
                    color: HexColor(greenColor),
                  )

              ),
            ),
            fallback: (context) => ConditionalBuilder(
              condition: AppCubit.get(context).myCartModel != null,
              builder: (context) => Column(
                children: [
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => ExpansionTileCartWidget(
                      productName: AppCubit.get(context).myCartModel!.data![index].itemId!
                          == '' ? 'not determined yet' :
                      AppCubit.get(context).myCartModel!.data![index].itemId! ,
                      productQuantity: AppCubit.get(context).myCartModel!.data![index].quantity!,
                      productPoints: AppCubit.get(context).myCartModel!.data![index].pointsDone!
                          == '' ? 'not determined yet' :
                      AppCubit.get(context).myCartModel!.data![index].pointsDone!
                      ,
                      totalPoints: AppCubit.get(context).myCartModel!.data![index].pointsDone!
                          == '' ? 'not determined yet' :
                      AppCubit.get(context).myCartModel!.data![index].pointsDone! *
                          AppCubit.get(context).numOfProductsInCart!,
                    ),
                    itemCount: AppCubit.get(context).myCartModel!.data!.length,
                  ),
                  space40Vertical(context),
                  MyButton(
                    onPressed: ()
                    {
                      AppCubit.get(context).makeOrder(
                        orderId: '${AppCubit.get(context).myCartModel!.data![0].orderId}',
                      );
                      debugPrint('id order is => ${AppCubit.get(context).myCartModel!.data![0].orderId}');
                    },
                    text: appTranslation(context).order,
                  ),
                ],
              ),
              fallback: (context) => Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: responsiveValue(
                      context,
                      150.0,
                    ),
                  ),
                  child: SvgPicture.asset(
                    'assets/images/empty_box.svg',
                    color: HexColor(greenColor),
                    height: responsiveValue(
                      context,
                      300.0,
                    ),
                    width: responsiveValue(
                      context,
                      300.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
