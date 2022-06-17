import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_house/core/util/constants.dart';
import 'package:green_house/core/util/cubit/state.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../../../core/util/cubit/cubit.dart';
import '../../../../core/util/widgets/my_button.dart';

class HelpWidget extends StatelessWidget {
  const HelpWidget({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    return BlocBuilder<AppCubit,AppState>(
      builder: (context, state) {
        return Padding(
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
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  appTranslation(context).aboutUs,
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppCubit.get(context).isDark ? whiteColor.withOpacity(0.7) : blackColor,
                  ),
                ),
                space16Vertical(context),
                Text(
                  appTranslation(context).aboutUsDescription,
                  style: Theme.of(context).textTheme.caption!.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: responsiveValue(
                      context,
                      14.0,
                    ),
                    color: AppCubit.get(context).isDark ? whiteColor.withOpacity(0.7) : blackColor,
                  ),
                ),

                space16Vertical(context),
                bigDivider(context),
                space16Vertical(context),

                Text(
                  appTranslation(context).howToUse,
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppCubit.get(context).isDark ? whiteColor.withOpacity(0.7) : blackColor,
                  ),
                ),
                space16Vertical(context),
                Text(
                  appTranslation(context).howToUseDescription,
                  style: Theme.of(context).textTheme.caption!.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: responsiveValue(
                      context,
                      14.0,
                    ),
                    color: AppCubit.get(context).isDark ? whiteColor.withOpacity(0.7) : blackColor,
                  ),
                ),

                space16Vertical(context),
                bigDivider(context),
                space16Vertical(context),

                Text(
                  appTranslation(context).connectUs,
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppCubit.get(context).isDark ? whiteColor.withOpacity(0.7) : blackColor,
                  ),
                ),
                space20Vertical(context),
                MyButton(
                  onPressed: () async
                  {
                    await launchUrlString('mailto:nadaibrahimaliabdall@gmail.com');
                  },
                  text: 'Press to send mail to Nada',
                ),
                space20Vertical(context),
                MyButton(
                  onPressed: () async
                  {
                    await launchUrlString('mailto:Ahlam@gmail.com');
                  },
                  text: 'Press to send mail to Ahlam',
                ),
                space20Vertical(context),
                MyButton(
                  onPressed: () async
                  {
                    await launchUrlString('mailto:Esraa@gmail.com');
                  },
                  text: 'Press to send mail to Esraa',
                ),
                space20Vertical(context),
                MyButton(
                  onPressed: () async
                  {
                    await launchUrlString('mailto:Aya@gmail.com');
                  },
                  text: 'Press to send mail to Aya',
                ),

                // const ContactUsExpansionTileWidget(
                //   subTitle: 'E-mail',
                //   email: 'nadaibrahimaliaball@gmail.com',
                //   title: 'Nada',
                // ),
                // space16Vertical(context),
                // const ContactUsExpansionTileWidget(
                //   subTitle: 'E-mail',
                //   email: 'ahlam@gmail.com',
                //   title: 'Ahlam',
                // ),
                // space16Vertical(context),
                // const ContactUsExpansionTileWidget(
                //   subTitle: 'E-mail',
                //   email: 'Esraa@gmail.com',
                //   title: 'Esraa',
                // ),
                // space16Vertical(context),
                // const ContactUsExpansionTileWidget(
                //   subTitle: 'E-mail',
                //   email: 'Aya@gmail.com',
                //   title: 'Aya',
                // ),

                // Theme(
                //   data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                //   child: ExpansionTile(
                //     title: Column(
                //       children: [
                //         Row(
                //           children: [
                //             Text(
                //               'Esraa',
                //               style: Theme.of(context).textTheme.caption!.copyWith(
                //                 fontWeight: FontWeight.w500,
                //                 fontSize: responsiveValue(
                //                   context,
                //                   18.0,
                //                 ),
                //                 color: AppCubit.get(context).isDark ? whiteColor.withOpacity(0.7) : blackColor,
                //               ),
                //             ),
                //           ],
                //         ),
                //       ],
                //     ),
                //     children: [
                //       Column(
                //         children:  [
                //           ListTile(
                //             title: Column(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: [
                //                 space10Vertical(context),
                //
                //                 Text(
                //                   'Email',
                //                   style: Theme.of(context).textTheme.caption!.copyWith(
                //                     fontWeight: FontWeight.w500,
                //                     fontSize: responsiveValue(
                //                       context,
                //                       16.0,
                //                     ),
                //                     color: AppCubit.get(context).isDark ? whiteColor : blackColor,
                //                   ),
                //                 ),
                //                 space5Vertical(context),
                //                 SelectableText(
                //                   'nadaibrahimaliabdall@gmail.com',
                //                   style: Theme.of(context).textTheme.caption!.copyWith(
                //                     fontWeight: FontWeight.w400,
                //                     fontSize: responsiveValue(
                //                       context,
                //                       16.0,
                //                     ),
                //                     color: AppCubit.get(context).isDark ? whiteColor.withOpacity(0.5) : blackColor.withOpacity(0.5),
                //                   ),
                //                 ),
                //
                //                 space10Vertical(context),
                //
                //                 Text(
                //                   'Phone Number',
                //                   style: Theme.of(context).textTheme.caption!.copyWith(
                //                     fontWeight: FontWeight.w500,
                //                     fontSize: responsiveValue(
                //                       context,
                //                       16.0,
                //                     ),
                //                     color: AppCubit.get(context).isDark ? whiteColor : blackColor,
                //                   ),
                //                 ),
                //                 space5Vertical(context),
                //                 SelectableText(
                //                   '0123456789',
                //                   style: Theme.of(context).textTheme.caption!.copyWith(
                //                     fontWeight: FontWeight.w400,
                //                     fontSize: responsiveValue(
                //                       context,
                //                       16.0,
                //                     ),
                //                     color: AppCubit.get(context).isDark ? whiteColor.withOpacity(0.5) : blackColor.withOpacity(0.5),
                //                   ),
                //                 )
                //
                //               ],
                //             ),
                //           ),
                //
                //
                //         ],
                //       ),
                //     ],
                //   ),
                // ),
                //
                // Theme(
                //   data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                //   child: ExpansionTile(
                //     title: Column(
                //       children: [
                //         Row(
                //           children: [
                //             Text(
                //               'Ahlam',
                //               style: Theme.of(context).textTheme.caption!.copyWith(
                //                 fontWeight: FontWeight.w500,
                //                 fontSize: responsiveValue(
                //                   context,
                //                   18.0,
                //                 ),
                //                 color: AppCubit.get(context).isDark ? whiteColor.withOpacity(0.7) : blackColor,
                //               ),
                //             ),
                //           ],
                //         ),
                //       ],
                //     ),
                //     children: [
                //       Column(
                //         children:  [
                //           ListTile(
                //             title: Column(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: [
                //                 space10Vertical(context),
                //
                //                 Text(
                //                   'Email',
                //                   style: Theme.of(context).textTheme.caption!.copyWith(
                //                     fontWeight: FontWeight.w500,
                //                     fontSize: responsiveValue(
                //                       context,
                //                       16.0,
                //                     ),
                //                     color: AppCubit.get(context).isDark ? whiteColor : blackColor,
                //                   ),
                //                 ),
                //                 space5Vertical(context),
                //                 SelectableText(
                //                   'nadaibrahimaliabdall@gmail.com',
                //                   style: Theme.of(context).textTheme.caption!.copyWith(
                //                     fontWeight: FontWeight.w400,
                //                     fontSize: responsiveValue(
                //                       context,
                //                       16.0,
                //                     ),
                //                     color: AppCubit.get(context).isDark ? whiteColor.withOpacity(0.5) : blackColor.withOpacity(0.5),
                //                   ),
                //                 ),
                //
                //                 space10Vertical(context),
                //
                //                 Text(
                //                   'Phone Number',
                //                   style: Theme.of(context).textTheme.caption!.copyWith(
                //                     fontWeight: FontWeight.w500,
                //                     fontSize: responsiveValue(
                //                       context,
                //                       16.0,
                //                     ),
                //                     color: AppCubit.get(context).isDark ? whiteColor : blackColor,
                //                   ),
                //                 ),
                //                 space5Vertical(context),
                //                 SelectableText(
                //                   '0123456789',
                //                   style: Theme.of(context).textTheme.caption!.copyWith(
                //                     fontWeight: FontWeight.w400,
                //                     fontSize: responsiveValue(
                //                       context,
                //                       16.0,
                //                     ),
                //                     color: AppCubit.get(context).isDark ? whiteColor.withOpacity(0.5) : blackColor.withOpacity(0.5),
                //                   ),
                //                 )
                //
                //               ],
                //             ),
                //           ),
                //
                //
                //         ],
                //       ),
                //     ],
                //   ),
                // ),
                //
                // Theme(
                //   data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                //   child: ExpansionTile(
                //     title: Column(
                //       children: [
                //         Row(
                //           children: [
                //             Text(
                //               'Aya',
                //               style: Theme.of(context).textTheme.caption!.copyWith(
                //                 fontWeight: FontWeight.w500,
                //                 fontSize: responsiveValue(
                //                   context,
                //                   18.0,
                //                 ),
                //                 color: AppCubit.get(context).isDark ? whiteColor.withOpacity(0.7) : blackColor,
                //               ),
                //             ),
                //           ],
                //         ),
                //       ],
                //     ),
                //     children: [
                //       Column(
                //         children:  [
                //           ListTile(
                //             title: Column(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: [
                //                 space10Vertical(context),
                //
                //                 Text(
                //                   'Email',
                //                   style: Theme.of(context).textTheme.caption!.copyWith(
                //                     fontWeight: FontWeight.w500,
                //                     fontSize: responsiveValue(
                //                       context,
                //                       16.0,
                //                     ),
                //                     color: AppCubit.get(context).isDark ? whiteColor : blackColor,
                //                   ),
                //                 ),
                //                 space5Vertical(context),
                //                 SelectableText(
                //                   'nadaibrahimaliabdall@gmail.com',
                //                   style: Theme.of(context).textTheme.caption!.copyWith(
                //                     fontWeight: FontWeight.w400,
                //                     fontSize: responsiveValue(
                //                       context,
                //                       16.0,
                //                     ),
                //                     color: AppCubit.get(context).isDark ? whiteColor.withOpacity(0.5) : blackColor.withOpacity(0.5),
                //                   ),
                //                 ),
                //
                //                 space10Vertical(context),
                //
                //                 Text(
                //                   'Phone Number',
                //                   style: Theme.of(context).textTheme.caption!.copyWith(
                //                     fontWeight: FontWeight.w500,
                //                     fontSize: responsiveValue(
                //                       context,
                //                       16.0,
                //                     ),
                //                     color: AppCubit.get(context).isDark ? whiteColor : blackColor,
                //                   ),
                //                 ),
                //                 space5Vertical(context),
                //                 SelectableText(
                //                   '0123456789',
                //                   style: Theme.of(context).textTheme.caption!.copyWith(
                //                     fontWeight: FontWeight.w400,
                //                     fontSize: responsiveValue(
                //                       context,
                //                       16.0,
                //                     ),
                //                     color: AppCubit.get(context).isDark ? whiteColor.withOpacity(0.5) : blackColor.withOpacity(0.5),
                //                   ),
                //                 )
                //
                //               ],
                //             ),
                //           ),
                //
                //
                //         ],
                //       ),
                //     ],
                //   ),
                // ),



                // InkWell(
                //   onTap:() async
                //   {
                //     final Email sendEmail = Email(
                //       body: 'messageController.text',
                //       subject: 'subjectController.text',
                //       recipients: ['mohammed.gallya39@gmail.com'],
                //       isHTML: false,
                //     );
                //     FlutterEmailSender.send(sendEmail);
                //   },
                //   child: Text(
                //     appTranslation(context).connectUs,
                //     style: Theme.of(context).textTheme.headline6!.copyWith(
                //       fontWeight: FontWeight.w700,
                //       color: AppCubit.get(context).isDark ? whiteColor.withOpacity(0.7) : blackColor,
                //     ),
                //   ),
                // ),



              ],
            ),
          ),
        );
      },
    );
  }
}
