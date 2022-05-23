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
import '../../../orders/presentation/pages/orders_page.dart';
import '../pages/help_page.dart';
import '../pages/partners_page.dart';
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
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: responsiveValue(
                context,
                12.0,
              ),
              vertical: responsiveValue(
                context,
                18.0,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [
                  Row(
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
                              fontWeight: FontWeight.w700,
                              color: AppCubit.get(context).isDark ? whiteColor : blackColor,
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
                     // const Spacer(),
                      Expanded(
                        child: Container(
                          // width: responsiveValue(
                          //   context,
                          //   120.0,
                          // ),
                          height: responsiveValue(
                            context,
                            50.0,
                          ),
                          decoration: BoxDecoration(
                            color: HexColor(greenColor).withOpacity(0.3),
                            borderRadius: BorderRadius.circular(
                              responsiveValue(
                                context,
                                4.0,
                              ),
                            ),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.point_of_sale,
                                  size: 22,
                                  color: AppCubit.get(context).isDark ? whiteColor : blackColor,
                                ),
                                space5Horizontal(context),
                                Text(
                                  appTranslation(context).myPoints,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.caption!.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: AppCubit.get(context).isDark ? whiteColor : blackColor,
                                  ),
                                ),
                                space10Horizontal(context),
                                Text(
                                  '444',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.caption!.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: AppCubit.get(context).isDark ? whiteColor : blackColor,

                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  space16Vertical(context),
                  bigDivider(context),
                  space16Vertical(context),

                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: ()
                          {
                            navigateTo(context, const OrderPage());
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.list_alt_outlined,
                                size: 22,
                                color: AppCubit.get(context).isDark ? whiteColor : blackColor,
                              ),
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
                      ),
                      space10Horizontal(context),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.sell_outlined,
                              size: 22,
                              color: AppCubit.get(context).isDark ? whiteColor : blackColor,
                            ),
                            space3Horizontal(context),
                            Text(
                              appTranslation(context).myItems,
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
                  space10Vertical(context),
                  bigDivider(context),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: responsiveValue(
                        context,
                        12.0,
                      ),
                      vertical: responsiveValue(
                        context,
                        18.0,
                      ),
                    ),
                    child: Text(
                        appTranslation(context).settings,
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppCubit.get(context).isDark ? whiteColor.withOpacity(0.7) : blackColor,
                        ),
                    ),
                  ),
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
                            onTapFirstOption: ()
                            {
                              AppCubit.get(context).changeMode(value: false);
                              Navigator.pop(context);
                            },
                            onTapSecondOption: ()
                            {
                              AppCubit.get(context).changeMode(value: true);
                              Navigator.pop(context);
                            },
                          ),
                        );
                      },

                    // (){}
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
                      );
                    },
                  ),
                  SettingsItem(
                    title: appTranslation(context).profile,
                    icon: Icons.person,
                    function: ()
                    {
                    },
                  ),
                  SettingsItem(
                    title: appTranslation(context).help,
                    icon: Icons.help_outline_outlined,
                    function: ()
                    {
                      navigateTo(context, const HelpPage());
                    },
                  ),
                  SettingsItem(
                    title: appTranslation(context).partners,
                    icon: Icons.apartment_outlined,
                    function: ()
                    {
                        navigateTo(context, const PartnersPage());
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
                                //AppCubit.get(context).logOut();
                              },
                              popButtonVoidCallback: (){
                                Navigator.pop(context);
                              },
                            );
                          });
                    },
                  ),
                ]
            ),
          ),
        );
      },
    );
    //   Center(
    //   child: Text(appTranslation(context).settings,),
    // );
  }
}
