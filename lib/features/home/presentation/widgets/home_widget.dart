import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_house/core/util/cubit/cubit.dart';
import 'package:green_house/core/util/cubit/state.dart';
import 'package:green_house/features/home/presentation/widgets/slider.dart';
import '../../../../core/util/constants.dart';
import '../../../../core/util/widgets/products.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit,AppState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: responsiveValue(
              context,
              6.0,
            ),
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SliderWidget(),
                bigDivider(context),
                space20Vertical(context),
                Products(
                  product: appTranslation(context).allProducts,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
