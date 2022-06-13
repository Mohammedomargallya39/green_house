import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../constants.dart';
import '../cubit/cubit.dart';
import 'my_button.dart';

class TwoOptionsDialog extends Dialog {
  final String message;
  final String pushButtonText;
  final String popButtonText;
  final VoidCallback pushButtonVoidCallback;
  final VoidCallback popButtonVoidCallback;
 final double height;

  const TwoOptionsDialog({
    required this.message,
    required this.popButtonText,
    required this.pushButtonText,
    required this.pushButtonVoidCallback,
    required this.popButtonVoidCallback,
    this.height = 160.0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: AppCubit.get(context).isRtl ? TextDirection.rtl : TextDirection.ltr,
      child: Dialog(
        backgroundColor:AppCubit.get(context).isDark ? HexColor(scaffoldBackgroundDark): HexColor(regularGrey),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        //this right here
        child: SizedBox(
          height: height,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontWeight: FontWeight.normal,
                      color: AppCubit.get(context).isDark ? whiteColor: blackColor,


                      ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: MyButton(onPressed: popButtonVoidCallback, text: popButtonText, colorButton:AppCubit.get(context).isDark ? HexColor(secondBackground): whiteColor, colorText: HexColor(mainColor),),
                    ),
                    space10Horizontal(context),
                    Expanded(
                      child: MyButton(onPressed: pushButtonVoidCallback, text: pushButtonText, colorButton: HexColor(red)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
