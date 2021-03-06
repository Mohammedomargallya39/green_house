import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/network/local/cache_helper.dart';
import '../../../../core/network/remote/api_endpoints.dart';
import '../../../../core/util/constants.dart';
import '../../../../core/util/cubit/cubit.dart';
import '../../../../core/util/cubit/state.dart';
import '../../../../core/util/widgets/logo.dart';
import '../../../../core/util/widgets/my_button.dart';
import '../../../../core/util/widgets/my_form.dart';
import '../../../../core/util/widgets/my_rich_text.dart';
import '../../../main/pages/main_page.dart';
import '../../../register/presentaion/pages/register_page.dart';
import '../../../setting/presentation/widgets/choose_between_two_options.dart';

class LoginWidget extends StatelessWidget {
  LoginWidget({Key? key}) : super(key: key);

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        if (state is UserLoginError) {
          Fluttertoast.showToast(
            msg: state.message.toString(),
          );
        }

        if(state is UserLoginSuccess) {
          sl<CacheHelper>().put('token', state.token);
          token = state.token;
          sl<CacheHelper>().put('points', state.points);
          pointsCached = state.points;
          sl<CacheHelper>().put('name', state.name);
          nameCached = state.name;
          sl<CacheHelper>().put('email', state.email);
          emailCached = state.email;
          Fluttertoast.showToast(
            msg: 'login success',
          );
          navigateAndFinish(context, const MainPageScreen());
        }
      },
      builder: (context, state) {
        return Padding(
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
            children: [
              Expanded(
                flex: 1,
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    IconButton(
                        onPressed: ()
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
                        icon: const Icon(Icons.language_outlined,)
                    ),
                    const Center(
                      child: AppLogo(),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          appTranslation(context).userLogin,
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                        ),
                        space50Vertical(context),
                        MyForm(
                          label: appTranslation(context).emailAddress,
                          controller: AppCubit.get(context).emailController,
                          type: TextInputType.emailAddress,
                          error: appTranslation(context).enterYourEmail,
                          isPassword: false,
                        ),
                        space10Vertical(context),
                        MyForm(
                          label: appTranslation(context).password,
                          controller: AppCubit.get(context).passwordController,
                          type: TextInputType.visiblePassword,
                          error: appTranslation(context).enterYourPassword,
                          isPassword: true,
                        ),
                        space40Vertical(context),
                        MyButton(
                            isLoading: state is UserLoginLoading,
                            onPressed: ()
                            {
                              if (formKey.currentState!.validate())
                              {
                                FocusScope.of(context).requestFocus(FocusNode());
                                AppCubit.get(context).userLogin();
                                debugPrint("Form is valid");
                              }
                              else
                              {
                                debugPrint("Form is invalid");
                              }
                            },
                            text: appTranslation(context).userLogin,
                        ),
                        space20Vertical(context),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Expanded(
                        //       child: Text(
                        //         appTranslation(context).dontHaveAccount,
                        //         overflow: TextOverflow.ellipsis,
                        //         textAlign: TextAlign.end,
                        //         maxLines: 1,
                        //         style: Theme.of(context)
                        //             .textTheme
                        //             .subtitle1!
                        //             .copyWith(fontWeight: FontWeight.w700),
                        //       ),
                        //     ),
                        //     Expanded(
                        //       child: MyTextButton(
                        //         title: appTranslation(context).newAccount,
                        //         textAlign: TextAlign.end,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // RichText(
                            //     text: TextSpan(
                            //       children:
                            //       [
                            //         TextSpan(
                            //           text: appTranslation(context).dontHaveAccount,
                            //           style: Theme.of(context)
                            //               .textTheme
                            //               .subtitle1!
                            //               .copyWith(fontWeight: FontWeight.w700),
                            //         ),
                            //         TextSpan(
                            //           text: '  ${appTranslation(context).newAccount}',
                            //           style: Theme.of(context)
                            //               .textTheme
                            //               .subtitle1!
                            //               .copyWith(fontWeight: FontWeight.w700,
                            //             color: HexColor(mainColor),
                            //           ),
                            //           recognizer: TapGestureRecognizer()..onTap =
                            //               ()
                            //           {
                            //             debugPrint('new account pressed');
                            //           },
                            //         ),
                            //       ]
                            //     )
                            // ),
                            MyRichText(
                                text: appTranslation(context).dontHaveAccount,
                                textButton: appTranslation(context).newAccount,
                                onTap: ()
                                {
                                  navigateTo(context, const RegisterPage());
                                }
                            )
                          ],
                        ),
                        // space20Vertical(context),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     DefaultIconButton(
                        //         icon: Icons.facebook, onPressed: () {}),
                        //    space10Horizontal(context),
                        //     DefaultIconButton(
                        //         icon: Icons.facebook, onPressed: () {}),
                        //     space10Horizontal(context),
                        //     DefaultIconButton(
                        //         icon: Icons.facebook, onPressed: () {}),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
