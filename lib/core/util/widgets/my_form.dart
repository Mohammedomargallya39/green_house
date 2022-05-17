import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import '../constants.dart';
import '../cubit/cubit.dart';
import '../cubit/state.dart';

class MyForm extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType type;
  final String error;
  final bool isPassword;

  const MyForm({
    Key? key,
    required this.label,
    required this.controller,
    required this.type,
    required this.error,
    required this.isPassword,
  }) : super(key: key);

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
  builder: (context, state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        space8Vertical(context),
        TextFormField(
          cursorColor:  HexColor(mainColor),
          obscureText: widget.isPassword ? isVisible : false,
          controller: widget.controller,
          style: Theme.of(context).textTheme.subtitle2!.copyWith(
                fontSize: 13.0,
              ),
          keyboardType: widget.type,
          validator: (value) {
            if (value!.isEmpty) {
              return widget.error;
            }

            return null;
          },
          decoration: InputDecoration(
            suffixIcon: widget.isPassword ? IconButton(
              onPressed: () {
                setState(() {
                  isVisible = !isVisible;
                });
              },
              icon: Icon(
                isVisible ? Icons.visibility : Icons.visibility_off,
                color: AppCubit.get(context).isDark? HexColor(regularGrey) : HexColor(darkGreyColor),
              ),
            ) : null,
            isDense: true,
            contentPadding: EdgeInsets.symmetric(
              vertical: responsiveValue(context, 12.0),
              horizontal: responsiveValue(context, 16.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                8.0,
              ),
              borderSide: BorderSide(
                color: HexColor(mainColor),
                width: 1.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                8.0,
              ),
              borderSide: BorderSide(
                color: HexColor(darkGreyColor),
                width: 1.0,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                8.0,
              ),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1.0,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                8.0,
              ),
              borderSide: BorderSide(
                color: HexColor(darkGreyColor),
                width: 1.0,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                8.0,
              ),
              borderSide: BorderSide(
                color: HexColor(mainColor),
                width: 1.0,
              ),
            ),
            filled: true,
            fillColor: AppCubit.get(context).isDark? HexColor(scaffoldBackgroundDark) : whiteColor,
          ),
        ),
      ],
    );
  },
);
  }
}
