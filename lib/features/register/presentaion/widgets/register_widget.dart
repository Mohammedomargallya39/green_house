import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../core/util/constants.dart';
import '../../../../core/util/cubit/cubit.dart';
import '../../../../core/util/cubit/state.dart';
import '../../../../core/util/widgets/logo.dart';
import '../../../../core/util/widgets/my_button.dart';
import '../../../../core/util/widgets/my_drop_down_button_field.dart';
import '../../../../core/util/widgets/my_form.dart';
import '../../../setting/presentation/widgets/choose_between_two_options.dart';

class RegisterWidget extends StatelessWidget {
  RegisterWidget({Key? key}) : super(key: key);


  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(
      listener: (context, state) {
        if(state is UserRegisterSuccess){
          Navigator.of(context).pop();
          Fluttertoast.showToast(msg: 'Register Success');
        }
      },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: responsiveValue(
                context,
                12.0,
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
                  flex: 3,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          space10Vertical(context),
                          Center(
                            child: Text(
                              appTranslation(context).createUserAccount,
                              style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          space50Vertical(context),
                          MyForm(
                              label: appTranslation(context).fullName,
                              controller: nameController,
                              type: TextInputType.name,
                              error: '${appTranslation(context).pleaseEnter} ${appTranslation(context).fullName}',
                              isPassword: false
                          ),
                          space10Vertical(context),
                          MyForm(
                              label: appTranslation(context).emailAddress,
                              controller: emailController,
                              type: TextInputType.emailAddress,
                              error: '${appTranslation(context).pleaseEnter} ${appTranslation(context).emailAddress}',
                              isPassword: false
                          ),
                          space10Vertical(context),
                          MyForm(
                              label: appTranslation(context).phone,
                              controller: phoneController,
                              type: TextInputType.phone,
                              error: '${appTranslation(context).pleaseEnter} ${appTranslation(context).phone}',
                              isPassword: false
                          ),
                          space10Vertical(context),
                          MyForm(
                              label: appTranslation(context).password,
                              controller: passwordController,
                              type: TextInputType.visiblePassword,
                              error: '${appTranslation(context).pleaseEnter} ${appTranslation(context).password}',
                              isPassword: true
                          ),
                          space10Vertical(context),
                          MyForm(
                              label: appTranslation(context).confirmPassword,
                              controller: confirmPasswordController,
                              type: TextInputType.visiblePassword,
                              error: '${appTranslation(context).pleaseEnter} ${appTranslation(context).confirmPassword}  ${appTranslation(context).right}',
                              isPassword: true
                          ),
                          space10Vertical(context),
                          // const MyDropDownButton(),
                          // space10Vertical(context),
                          MyForm(
                              label: appTranslation(context).address,
                              controller: addressController,
                              type: TextInputType.streetAddress,
                              error: '${appTranslation(context).pleaseEnter} ${appTranslation(context).address}',
                              isPassword: false
                          ),
                          space40Vertical(context),
                          MyButton(
                            onPressed: ()
                            {
                              if (formKey.currentState!.validate() && passwordController.text == confirmPasswordController.text)
                              {
                                debugPrint("Form is valid");
                                AppCubit.get(context).userRegister(
                                    name: nameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    confirmPassword: confirmPasswordController.text,
                                    mobile: phoneController.text,
                                    address: addressController.text,
                                    //city: AppCubit.get(context).selectGovernment.titleEn,
                                    //'${AppCubit.get(context).selectGovernment} ${addressController.text}',
                                );
                              }
                              else
                              {
                                debugPrint("Form is invalid");
                                //debugPrint("${AppCubit.get(context).selectGovernment}");
                              }
                            },
                            text: appTranslation(context).newAccount,
                          ),
                          space20Vertical(context),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        );
  }
}
