import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_house/core/util/widgets/my_button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../../../core/util/constants.dart';
import '../../../../core/util/cubit/cubit.dart';
import '../../../../core/util/cubit/state.dart';

class ContactUsExpansionTileWidget extends StatelessWidget {
  const ContactUsExpansionTileWidget({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.email
  }) : super(key: key);

  final String? title;
  final String? subTitle;
  final String? email;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit,AppState>(
      builder: (context, state) {
        return Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            trailing: Icon(
              AppCubit.get(context).customTileExpanded ?
              Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              color: AppCubit.get(context).isDark ?
              whiteColor.withOpacity(0.7) : blackColor,
            ),
            onExpansionChanged: (value)
            {
              AppCubit.get(context).changeCustomTileExpanded();
              AppCubit.get(context).customTileExpanded = value;
            },
            title: Row(
              children: [
                Text(
                  title!,
                  style: Theme.of(context).textTheme.caption!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: responsiveValue(
                      context,
                      18.0,
                    ),
                    color: AppCubit.get(context).isDark ? whiteColor.withOpacity(0.7) : blackColor,
                  ),
                ),
              ],
            ),
            children: [
              ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    space10Vertical(context),

                    Text(
                      subTitle!,
                      style: Theme.of(context).textTheme.caption!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: responsiveValue(
                          context,
                          16.0,
                        ),
                        color: AppCubit.get(context).isDark ? whiteColor : blackColor,
                      ),
                    ),
                    space5Vertical(context),
                    SelectableText(
                      email!,
                      style: Theme.of(context).textTheme.caption!.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: responsiveValue(
                          context,
                          16.0,
                        ),
                        color: AppCubit.get(context).isDark ? whiteColor.withOpacity(0.7) : blackColor.withOpacity(0.7),
                      ),
                    ),
                    space20Vertical(context),

                    MyButton(
                      onPressed: () async
                      {
                        await launchUrlString('mailto:mohammed.gallya39@gmail.com');
                      },
                        text: 'Press to send mail',
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
