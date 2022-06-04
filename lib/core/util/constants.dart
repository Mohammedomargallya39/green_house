import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:flutter/material.dart';
import 'package:green_house/core/util/translation.dart';
import 'package:green_house/core/util/widgets/my_button.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:restart_app/restart_app.dart';
import '../../features/login/presentaion/pages/login_page.dart';
import '../di/injection.dart';
import '../models/select_government_model.dart';
import '../network/local/cache_helper.dart';
import 'cubit/cubit.dart';

int selectedService = 0;
int selectedCategory = 0;
bool isEnglish = true;

DataConnectionStatus? isConnection;

const String serverFailureMessage = 'Server Failure';
const String cacheFailureMessage = 'Cache Failure';

const String mainColor = '#1fcd6c';

const String secondary = '303C47';
const String secondaryVariant = '6A6D78';

const String thirdColor = 'fcb955';


const String darkGreyColor = '989898';
const String regularGrey = 'E9E8E7';
const String liteGreyColor = 'F9F8F7';
const String boxBackground = '#e6e3e3';

const String green = '#1fcd6c';
const String red = '#F21A0E';

const String greenColor = '07B055';
const String blueColor = '0E72ED';

const Color secondaryVariantRGB = Color.fromRGBO(33, 36, 36, 0.7);
const Color mainColorRGB = Color.fromRGBO(56, 161, 32, 1.0);

const Color secondColorRGB = Color.fromRGBO(252, 185, 85, 1);


// dark colors
String scaffoldBackgroundDark = '333739';
const String secondBackground = '393d40';
String secondaryVariantDark = '8a8a89';

String secondaryDark = 'ffffff';


const Color whiteColor = Colors.white;
const Color blackColor = Colors.black;

const Map<int, Color> color = {
  50: Color.fromRGBO(136, 14, 79, .1),
  100: Color.fromRGBO(136, 14, 79, .2),
  200: Color.fromRGBO(136, 14, 79, .3),
  300: Color.fromRGBO(136, 14, 79, .4),
  400: Color.fromRGBO(136, 14, 79, .5),
  500: Color.fromRGBO(136, 14, 79, .6),
  600: Color.fromRGBO(136, 14, 79, .7),
  700: Color.fromRGBO(136, 14, 79, .8),
  800: Color.fromRGBO(136, 14, 79, .9),
  900: Color.fromRGBO(136, 14, 79, 1),
};

String getTranslatedText({
  required String en,
  required String ar,
  required BuildContext context,
}) {
  if (AppCubit
      .get(context)
      .isRtl) {
    return ar;
  }
  return en;
}



String displayTranslatedText({
  required BuildContext context,
  required String ar,
  required String en,
}) =>
    AppCubit
        .get(context)
        .isRtl ? ar : en;


Widget bigDivider(context) =>
    Container(
      width: double.infinity,
      height: 4.0,
      color: HexColor(boxBackground),
    );

Future<void> showLogoutDialog({
  required BuildContext context,
  required Function function,
}) async {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) =>
        Dialog(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
                color: whiteColor),
            padding: EdgeInsets.all(
              responsiveValue(
                context,
                16.0,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    appTranslation(context).logoutConfirmation,
                    style: Theme
                        .of(context)
                        .textTheme
                        .subtitle1,
                  ),
                ),
                space20Vertical(context),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            5.0,
                          ),
                          color: Theme
                              .of(context)
                              .primaryColor
                              .withOpacity(
                            .1,
                          ),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: MaterialButton(
                          color: HexColor(liteGreyColor),
                          height: 52.0,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            appTranslation(context).cancel,
                            style: Theme
                                .of(context)
                                .textTheme
                                .button!
                                .copyWith(
                              color: HexColor(secondaryVariant),
                            ),
                          ),
                        ),
                      ),
                    ),
                    space8Horizontal(context),
                    Expanded(
                      child: MyButton(
                        onPressed: () {
                          function();
                        },
                        text: appTranslation(context).yes,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
  );
}


TranslationModel appTranslation(context) =>
    AppCubit.get(context).translationModel;

double pxToDp(double pixel) => pixel * 1.2;



void navigateTo(context, widget) =>
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

Widget myDivider(context) =>
    Divider(
      height: 1.0,
      color: HexColor(regularGrey),
    );

Future<void> myBottomSheet({
  required BuildContext context,
  required Widget widget,
}) =>
    showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.0),
            topRight: Radius.circular(8.0),
          ),
        ),
        builder: (context) {
          return Directionality(
            textDirection: AppCubit
                .get(context)
                .isRtl
                ? TextDirection.rtl
                : TextDirection.ltr,
            child: Container(
              padding: const EdgeInsets.all(22.0),
              decoration: BoxDecoration(
                color: Theme
                    .of(context)
                    .scaffoldBackgroundColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery
                      .of(context)
                      .viewInsets
                      .bottom,
                ),
                child: widget,
              ),
            ),
          );
        });

void navigateAndFinish(context, widget) =>
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ),
            (Route<dynamic> route) => false);

void debugPrintFullText(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => debugPrint(match.group(0)));
}

class MyDivider extends StatelessWidget {
  const MyDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1.0,
      color: HexColor(regularGrey),
    );
  }
}

double responsiveValue(BuildContext context, double value) =>
    MediaQuery
        .of(context)
        .size
        .width * (value / 375.0);

space2Vertical(BuildContext context) =>
    SizedBox(
      height: responsiveValue(context, 2.0),
    );

space3Vertical(BuildContext context) =>
    SizedBox(
      height: responsiveValue(context, 3.0),
    );

space4Vertical(BuildContext context) =>
    SizedBox(
      height: responsiveValue(context, 4.0),
    );

space5Vertical(BuildContext context) =>
    SizedBox(
      height: responsiveValue(context, 5.0),
    );

space8Vertical(BuildContext context) =>
    SizedBox(
      height: responsiveValue(context, 8.0),
    );

space10Vertical(BuildContext context) =>
    SizedBox(
      height: responsiveValue(context, 10.0),
    );

space16Vertical(BuildContext context) =>
    SizedBox(
      height: responsiveValue(context, 16.0),
    );

space20Vertical(BuildContext context) =>
    SizedBox(
      height: responsiveValue(context, 20.0),
    );

space30Vertical(BuildContext context) =>
    SizedBox(
      height: responsiveValue(context, 30.0),
    );

space40Vertical(BuildContext context) =>
    SizedBox(
      height: responsiveValue(context, 40.0),
    );

space50Vertical(BuildContext context) =>
    SizedBox(
      height: responsiveValue(context, 50.0),
    );

space60Vertical(BuildContext context) =>
    SizedBox(
      height: responsiveValue(context, 60.0),
    );

space70Vertical(BuildContext context) =>
    SizedBox(
      height: responsiveValue(context, 70.0),
    );

space80Vertical(BuildContext context) =>
    SizedBox(
      height: responsiveValue(context, 80.0),
    );

space90Vertical(BuildContext context) =>
    SizedBox(
      height: responsiveValue(context, 90.0),
    );

space100Vertical(BuildContext context) =>
    SizedBox(
      height: responsiveValue(context, 100.0),
    );

space3Horizontal(BuildContext context) =>
    SizedBox(
      width: responsiveValue(context, 3.0),
    );

space4Horizontal(BuildContext context) =>
    SizedBox(
      width: responsiveValue(context, 4.0),
    );

space5Horizontal(BuildContext context) =>
    SizedBox(
      width: responsiveValue(context, 5.0),
    );

space8Horizontal(BuildContext context) =>
    SizedBox(
      width: responsiveValue(context, 8.0),
    );

space10Horizontal(BuildContext context) =>
    SizedBox(
      width: responsiveValue(context, 10.0),
    );

space12Horizontal(BuildContext context) =>
    SizedBox(
      width: responsiveValue(context, 12.0),
    );

space14Horizontal(BuildContext context) =>
    SizedBox(
      width: responsiveValue(context, 14.0),
    );

space15Horizontal(BuildContext context) =>
    SizedBox(
      width: responsiveValue(context, 15.0),
    );

space16Horizontal(BuildContext context) =>
    SizedBox(
      width: responsiveValue(context, 16.0),
    );

space20Horizontal(BuildContext context) =>
    SizedBox(
      width: responsiveValue(context, 20.0),
    );

space30Horizontal(BuildContext context) =>
    SizedBox(
      width: responsiveValue(context, 30.0),
    );

space40Horizontal(BuildContext context) =>
    SizedBox(
      width: responsiveValue(context, 40.0),
    );

space50Horizontal(BuildContext context) =>
    SizedBox(
      width: responsiveValue(context, 50.0),
    );

space60Horizontal(BuildContext context) =>
    SizedBox(
      width: responsiveValue(context, 60.0),
    );

space70Horizontal(BuildContext context) =>
    SizedBox(
      width: responsiveValue(context, 70.0),
    );

space80Horizontal(BuildContext context) =>
    SizedBox(
      width: responsiveValue(context, 80.0),
    );

space90Horizontal(BuildContext context) =>
    SizedBox(
      width: responsiveValue(context, 90.0),
    );

space100Horizontal(BuildContext context) =>
    SizedBox(
      width: responsiveValue(context, 100.0),
    );


final List<SelectGovernmentModel> cities = [
  SelectGovernmentModel(
      titleEn: 'Choose',
      titleAr: 'اختر',
      selectCityType: 0
  ),

  SelectGovernmentModel(
      titleEn: 'Cairo',
      titleAr: 'القاهرة',
      selectCityType: 1
  ),

  SelectGovernmentModel(
      titleEn: 'Damietta',
      titleAr: 'دمياط',
      selectCityType: 2
  ),

  SelectGovernmentModel(
      titleEn: 'Dakahlia',
      titleAr: 'الدقهلية',
      selectCityType: 3
  ),

  SelectGovernmentModel(
      titleEn: 'Sharqia',
      titleAr: 'الشرقية',
      selectCityType: 4
  ),

  SelectGovernmentModel(
      titleEn: 'Qalyubia',
      titleAr: 'القليوبية',
      selectCityType: 5
  ),

  SelectGovernmentModel(
      titleEn: 'Kafr El-Sheikh',
      titleAr: 'كفر الشيخ',
      selectCityType: 6
  ),

  SelectGovernmentModel(
      titleEn: 'Gharbiyah',
      titleAr: 'الغربية',
      selectCityType: 7
  ),

  SelectGovernmentModel(
      titleEn: 'Menoufia',
      titleAr: 'المنوفية',
      selectCityType: 8
  ),

  SelectGovernmentModel(
      titleEn: 'Behira',
      titleAr: 'البحيرة',
      selectCityType: 9
  ),

  SelectGovernmentModel(
      titleEn: 'Ismailia',
      titleAr: 'الإسماعيلية',
      selectCityType: 10
  ),

  SelectGovernmentModel(
      titleEn: 'Alexandria',
      titleAr: 'الإسكندرية',
      selectCityType: 11
  ),

  SelectGovernmentModel(
      titleEn: 'Giza',
      titleAr: 'الجيزة',
      selectCityType: 12
  ),

  SelectGovernmentModel(
      titleEn: 'Bani Sweif',
      titleAr: 'بني سويف',
      selectCityType: 13
  ),

  SelectGovernmentModel(
      titleEn: 'Fayoum',
      titleAr: 'الفيوم',
      selectCityType: 14
  ),

  SelectGovernmentModel(
      titleEn: 'Minya',
      titleAr: 'المنيا',
      selectCityType: 15
  ),

  SelectGovernmentModel(
      titleEn: 'Asyut',
      titleAr: 'أسيوط',
      selectCityType: 16
  ),

  SelectGovernmentModel(
      titleEn: 'Sohag',
      titleAr: 'سوهاج',
      selectCityType: 17
  ),

  SelectGovernmentModel(
      titleEn: 'qana',
      titleAr: 'قنا',
      selectCityType: 18
  ),

  SelectGovernmentModel(
      titleEn: 'Aswan',
      titleAr: 'أسوان',
      selectCityType: 19
  ),

  SelectGovernmentModel(
      titleEn: 'Luxor',
      titleAr: 'الأقصر',
      selectCityType: 20
  ),

  SelectGovernmentModel(
      titleEn: 'Port Said',
      titleAr: 'بورسعيد',
      selectCityType: 21
  ),

  SelectGovernmentModel(
      titleEn: 'Red Sea',
      titleAr: 'البحر الأحمر',
      selectCityType: 22
  ),

  SelectGovernmentModel(
      titleEn: 'New Valley',
      titleAr: 'الوادي الجديد',
      selectCityType: 23
  ),

  SelectGovernmentModel(
      titleEn: 'Matruh',
      titleAr: 'مطروح',
      selectCityType: 24
  ),

  SelectGovernmentModel(
      titleEn: 'North Sinai',
      titleAr: 'شمال سيناء',
      selectCityType: 25
  ),

  SelectGovernmentModel(
      titleEn: 'South of Sinai',
      titleAr: 'جنوب سيناء',
      selectCityType: 26
  ),

  SelectGovernmentModel(
      titleEn: 'Suez',
      titleAr: 'السويس',
      selectCityType: 27
  ),


  SelectGovernmentModel(
      titleEn: 'Helwan',
      titleAr: 'حلوان',
      selectCityType: 28
  ),


  SelectGovernmentModel(
      titleEn: '6 October',
      titleAr: '6 اكتوبر',
      selectCityType: 29
  ),


  SelectGovernmentModel(
      titleEn: 'outside the republic',
      titleAr: 'خارج الجمهورية',
      selectCityType: 30
  ),

];

void signOut (context)
{
  sl<CacheHelper>().clear('token').then((value)
  {
    if(value)
    {
      navigateAndFinish(context, const LoginScreen(),);
      Restart.restartApp();
    }
  });
}
