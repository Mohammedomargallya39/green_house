import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../models/select_government_model.dart';
import '../constants.dart';
import '../cubit/cubit.dart';
import '../cubit/state.dart';

class MyDropDownButton extends StatelessWidget {
  const MyDropDownButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            space5Vertical(context),
            Text(
              appTranslation(context).select,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            space10Vertical(context),
            DropdownButtonFormField(
              isExpanded: true,
              isDense: false,
              decoration: InputDecoration(
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
                  borderSide: const BorderSide(
                    color: Colors.red,
                    width: 1.0,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
              ),
              validator: (value) {
                if (value ==  AppCubit.get(context).selectGovernment) {
                  return appTranslation(context).select;
                }
                return null;
              },
              value: AppCubit.get(context).selectGovernment,
              dropdownColor: Colors.white,
              alignment: Alignment.center,
              icon: const Icon(
                Icons.arrow_drop_down,
                color: Colors.grey,
              ),
              style: Theme.of(context).textTheme.subtitle2!,
              onChanged: (SelectGovernmentModel? newValue) {
                AppCubit.get(context).changeSelectGovernment(
                  value: newValue!,
                );
                print(AppCubit.get(context).selectGovernment);
              },
              items: cities.map<DropdownMenuItem<SelectGovernmentModel>>(
                  (SelectGovernmentModel value) {
                return DropdownMenuItem<SelectGovernmentModel>(
                  value: value,
                  child: Text(
                    displayTranslatedText(
                        context: context, ar: value.titleAr, en: value.titleEn),
                  ),
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}
