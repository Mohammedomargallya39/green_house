import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/util/constants.dart';
import '../../../../core/util/cubit/cubit.dart';
import '../../../../core/util/cubit/state.dart';

class ChooseYourOption extends StatelessWidget {
  const ChooseYourOption({
    Key? key,
    required this.titleFirstOption,
    required this.fullTitleFirstOption,
    required this.secondTitleOption,
    required this.fullSecondTitleOption,
    required this.onTapFirstOption,
    required this.onTapSecondOption,

  }) : super(key: key);
  final IconData titleFirstOption;
  final String fullTitleFirstOption;
  final IconData secondTitleOption;
  final String fullSecondTitleOption;
  final Function() onTapFirstOption;
  final Function() onTapSecondOption;




  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit,AppState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children:
          [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: InkWell(
                onTap: onTapFirstOption,
                child: Row(
                  children: [
                    // Text(
                    //   titleFirstOption,
                    //   style: Theme.of(context).textTheme.bodyText2,
                    // ),

                     Icon(
                         titleFirstOption,
                        color: AppCubit.get(context).isDark ? whiteColor.withOpacity(0.7) : blackColor,
                     ),
                    space10Horizontal(context),
                    Expanded(
                      child: Text(
                        fullTitleFirstOption,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppCubit.get(context).isDark ? whiteColor.withOpacity(0.7) : blackColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const MyDivider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: InkWell(
                onTap: onTapSecondOption,
                child: Row(
                  children: [
                    Icon(
                        secondTitleOption,
                        color: AppCubit.get(context).isDark ? whiteColor.withOpacity(0.7) : blackColor,
                    ),
                    space10Horizontal(context),
                    Expanded(
                      child: Text(
                        fullSecondTitleOption,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppCubit.get(context).isDark ? whiteColor.withOpacity(0.7) : blackColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
