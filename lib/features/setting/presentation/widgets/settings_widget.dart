import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:green_house/features/setting/presentation/widgets/setting_item.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../core/util/constants.dart';
import '../../../../core/util/cubit/cubit.dart';
import '../../../../core/util/cubit/state.dart';
import '../../../../core/util/widgets/logo.dart';
import '../../../../core/util/widgets/two_options_dialog.dart';
import 'choose_between_two_options.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit,AppState>(
      builder: (context, state)
      {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundColor: HexColor(regularGrey),
                        child: const CircleAvatar(
                          radius: 33,
                          backgroundColor: whiteColor,
                          child: AppLogo(),
                        ),
                      ),
                      space10Horizontal(context),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Account',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                fontWeight: FontWeight.w700
                            ),
                            ),
                            space3Vertical(context),
                            Text(
                              'Account@test.com',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.caption!.copyWith(
                                  fontWeight: FontWeight.w700
                              ),
                            ),
                          ],
                        ),
                      ),
                      space40Horizontal(context),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(Icons.list_alt_outlined),
                            space3Vertical(context),
                            Text(
                              appTranslation(context).myOrders,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.caption!.copyWith(
                                  fontWeight: FontWeight.w700
                              ),
                            ),
                          ],
                        ),
                      ),
                      space10Horizontal(context),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(Icons.point_of_sale_outlined),
                            space3Vertical(context),
                            Text(
                              appTranslation(context).myPoints,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.caption!.copyWith(
                                  fontWeight: FontWeight.w700
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
                bigDivider(context),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                            appTranslation(context).settings,
                            style: Theme.of(context).textTheme.headline6!.copyWith(
                                fontWeight: FontWeight.w700
                            ),
                        ),
                      ),
                      space3Vertical(context),
                      SettingsItem(
                          title: appTranslation(context).mode,
                          icon: Icons.brightness_2_outlined,
                          function: ()
                          {
                            myBottomSheet(
                              context: context,
                              widget: ChooseYourOption(
                                titleFirstOption: Icons.brightness_5_outlined,
                                fullTitleFirstOption: appTranslation(context).lightMode,
                                secondTitleOption: Icons.brightness_4_outlined,
                                fullSecondTitleOption: appTranslation(context).darkMode,
                                onTapFirstOption: () {},
                                onTapSecondOption: () {},
                              ),
                            );
                          },
                      ),
                      SettingsItem(
                        title: appTranslation(context).language,
                        icon: Icons.language_outlined,
                        function: ()
                        {
                          myBottomSheet(
                              context: context,
                              widget: ChooseYourOption(
                                  titleFirstOption: Icons.abc_sharp,
                                  fullTitleFirstOption: appTranslation(context).english,
                                  secondTitleOption: Icons.language_outlined,
                                  fullSecondTitleOption: appTranslation(context).arabic,
                                  onTapFirstOption: ()
                                {
                                    if (AppCubit.get(context).isRtl == false) {
                                      Navigator.pop(context);
                                    }
                                    if (AppCubit.get(context).isRtl == true) {
                                      AppCubit.get(context).changeLanguage(value: false);
                                      Navigator.pop(context);
                                    }

                                  },
                                  onTapSecondOption: ()
                                          {
                                            if (AppCubit.get(context).isRtl == true) {
                                              Navigator.pop(context);
                                            }
                                            if (AppCubit.get(context).isRtl == false) {
                                              AppCubit.get(context).changeLanguage(value: true);
                                              Navigator.pop(context);
                                            }
                                          },
                              ),
                              // Column(
                              //     crossAxisAlignment: CrossAxisAlignment.start,
                              //     mainAxisSize: MainAxisSize.min,
                              //     children:
                              //     [
                              //       Padding(
                              //         padding: const EdgeInsets.symmetric(vertical: 16.0),
                              //         child: InkWell(
                              //           onTap: ()
                              //           {
                              //             if (AppCubit.get(context).isRtl == false) {
                              //               Navigator.pop(context);
                              //             }
                              //             if (AppCubit.get(context).isRtl == true) {
                              //               AppCubit.get(context).changeLanguage(value: false);
                              //               Navigator.pop(context);
                              //             }
                              //
                              //           },
                              //           child: Row(
                              //             children: [
                              //               Text(
                              //                 '(En)',
                              //                 style: Theme.of(context).textTheme.bodyText2,
                              //               ),
                              //               space10Horizontal(context),
                              //               Expanded(
                              //                 child: Text(
                              //                   appTranslation(context).english,
                              //                   style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              //                     fontWeight: FontWeight.w400,
                              //                   ),
                              //                 ),
                              //               ),
                              //             ],
                              //           ),
                              //         ),
                              //       ),
                              //       const MyDivider(),
                              //       Padding(
                              //         padding: const EdgeInsets.symmetric(vertical: 16.0),
                              //         child: InkWell(
                              //           onTap: ()
                              //           {
                              //             if (AppCubit.get(context).isRtl == true) {
                              //               Navigator.pop(context);
                              //             }
                              //             if (AppCubit.get(context).isRtl == false) {
                              //               AppCubit.get(context).changeLanguage(value: true);
                              //               Navigator.pop(context);
                              //             }
                              //           },
                              //           child: Row(
                              //             children: [
                              //               Text(
                              //                 '(Ar)',
                              //                 style: Theme.of(context).textTheme.bodyText2,
                              //               ),
                              //               space10Horizontal(context),
                              //               Expanded(
                              //                 child: Text(
                              //                   appTranslation(context).arabic,
                              //                   style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              //                     fontWeight: FontWeight.w400,
                              //                   ),
                              //                 ),
                              //               ),
                              //             ],
                              //           ),
                              //         ),
                              //       ),
                              //     ],
                              // ),
                          );
                        },
                      ),
                      SettingsItem(
                        title: appTranslation(context).aboutUs,
                        icon: Icons.info_outlined,
                        function: ()
                        {

                        },
                      ),
                      SettingsItem(
                        title: appTranslation(context).connectUs,
                        icon: Icons.headset_mic_outlined,
                        function: ()
                        {

                        },
                      ),
                      SettingsItem(
                        title: appTranslation(context).howToUse,
                        icon: Icons.help_outline_outlined,
                        function: ()
                        {

                        },
                      ),
                      SettingsItem(
                        title: appTranslation(context).partners,
                        icon: Icons.apartment_outlined,
                        function: ()
                        {

                        },
                      ),
                      SettingsItem(
                        title: appTranslation(context).termsOfUse,
                        icon: Icons.account_tree_outlined,
                        function: ()
                        {

                        },
                      ),
                      SettingsItem(
                        title: appTranslation(context).logOut,
                        icon: Icons.logout_outlined,
                        function: ()
                        {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return  TwoOptionsDialog(
                                  message: appTranslation(context).logoutConfirmation,
                                  popButtonText: appTranslation(context).cancel,
                                  pushButtonText:  appTranslation(context).yes,
                                  pushButtonVoidCallback: (){
                                    /// في مشكلة هنا///
                                    Fluttertoast.showToast(
                                      msg: 'logout success',
                                    );
                                    signOut(context);
                                    AppCubit.get(context).logOut();
                                  },
                                  popButtonVoidCallback: (){
                                    Navigator.pop(context);
                                  },
                                );
                              });
                        },
                      ),
                    ],
                  ),
                ),
              ]
          ),
        );
      },
    );
    //   Center(
    //   child: Text(appTranslation(context).settings,),
    // );
  }
}
