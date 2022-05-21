import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_house/core/util/constants.dart';
import 'package:green_house/core/util/cubit/cubit.dart';
import 'package:green_house/core/util/cubit/state.dart';

class PartnersWidget extends StatelessWidget {
  const PartnersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit,AppState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: responsiveValue(context, 150),
              height: responsiveValue(context, 150),
            ),
            Text(
              'Green House',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: responsiveValue(
                  context,
                  18.0,
                ),
                color: AppCubit.get(context).isDark ? whiteColor.withOpacity(0.7) : blackColor,
              ),
            ),
            space10Vertical(context),
            Text(
              'Green House is a platform for the farmers to sell their products and services to the consumers.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.caption!.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: responsiveValue(
                  context,
                  16.0,
                ),
                color: AppCubit.get(context).isDark ? whiteColor.withOpacity(0.5) : blackColor.withOpacity(0.5),
              ),
            ),
            space10Vertical(context),
            bigDivider(context)

          ],
        );
      },
    );
  }
}
