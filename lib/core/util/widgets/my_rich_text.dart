import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../constants.dart';
import 'my_text_button.dart';

class MyRichText extends StatelessWidget {
  const MyRichText({Key? key, required this.text, required this.textButton, required this.onTap}) : super(key: key);
  final String text;
  final String textButton;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return RichText(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        text: WidgetSpan(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: responsiveValue(
                        context,
                        15.0,
                      ),
                  ),

                ),
                MyTextButton(
                  title: textButton,
                  onTap: onTap,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: HexColor(mainColor),
                    fontWeight: FontWeight.w700,
                    fontSize: responsiveValue(
                      context,
                      15.0,
                    ),
                  ),
                ),
              ],
            )
        ),

        // TextSpan(
        //     children:
        //     [
        //       TextSpan(
        //         text: text,
        //         style: Theme.of(context)
        //             .textTheme
        //             .subtitle1!
        //             .copyWith(fontWeight: FontWeight.w700),
        //       ),
        //       WidgetSpan(
        //           child: MyTextButton(
        //             title: textButton,
        //           ),
        //       ),
        //       // TextSpan(
        //       //   text: textButton,
        //       //   style: Theme.of(context)
        //       //       .textTheme
        //       //       .subtitle1!
        //       //       .copyWith(fontWeight: FontWeight.w700,
        //       //     color: HexColor(mainColor),
        //       //   ),
        //       //   recognizer: TapGestureRecognizer()..onTap = onTap,
        //       //
        //       // ),
        //     ]
        // )
    );
  }
}
