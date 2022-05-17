import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/util/constants.dart';
import '../../../../core/util/cubit/cubit.dart';
import '../../../../core/util/cubit/state.dart';
import '../../../../core/util/widgets/logo.dart';
import '../../../../core/util/widgets/my_button.dart';
import '../../../../core/util/widgets/my_drop_down_button_field.dart';
import '../../../../core/util/widgets/my_form.dart';

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
    return BlocBuilder<AppCubit,AppState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const Expanded(
                  flex: 1,
                  child: Center(
                    child: AppLogo(),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                              label: appTranslation(context).phone,
                              controller: phoneController,
                              type: TextInputType.phone,
                              error: '${appTranslation(context).pleaseEnter} ${appTranslation(context).phone}',
                              isPassword: false
                          ),
                          space10Vertical(context),
                          MyForm(
                              label: appTranslation(context).address,
                              controller: addressController,
                              type: TextInputType.streetAddress,
                              error: '${appTranslation(context).pleaseEnter} ${appTranslation(context).address}',
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
                          // space10Vertical(context),
                          // const MyDropDownButton(),
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
                          space40Vertical(context),
                          MyButton(
                            onPressed: ()
                            {
                              if (formKey.currentState!.validate() && passwordController.text == confirmPasswordController.text)
                              {
                                debugPrint("Form is valid");
                              }
                              else
                              {
                                debugPrint("Form is invalid");
                              }
                            },
                            text: appTranslation(context).newAccount,
                          ),
                          space30Vertical(context),
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
