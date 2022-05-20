import 'dart:convert';
import 'dart:io';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_house/core/util/cubit/state.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../di/injection.dart';
import '../../models/login_model.dart';
import '../../models/logout_model.dart';
import '../../models/select_government_model.dart';
import '../../network/local/cache_helper.dart';
import '../../network/repository.dart';
import '../constants.dart';
import '../translation.dart';

class AppCubit extends Cubit<AppState> {
  final Repository _repository;

  AppCubit({
    required Repository repository,
  })  : _repository = repository,
        super(Empty());

  static AppCubit get(context) => BlocProvider.of(context);

  late TranslationModel translationModel;

  bool isRtl = false;
  bool isRtlChange = false;
  bool isDark = false;
  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;
  late ThemeData lightTheme;
  late ThemeData darkTheme;
  late String family;

  void changeSuffix() {
    isPassword = !isPassword;
    suffix =
    isPassword ? Icons.visibility: Icons.visibility_off;
    emit(UserChangeLoginSuffixState());
  }

  void setThemes({
    required bool dark,
    required bool rtl,
  }) {
    isRtl = rtl;
    isRtlChange = rtl;
    isDark = dark;

    debugPrint('dark mode now is------------- $isDark');

    changeTheme();

    emit(ThemeLoaded());
  }


  void changeLanguage({required bool value}) async {
    isRtl = !isRtl;

    sl<CacheHelper>().put('isRtl', isRtl);
    String translation = await rootBundle
        .loadString('assets/translations/${isRtl ? 'ar' : 'en'}.json');

    setTranslation(
      translation: translation,
    );

    emit(ChangeLanguageState());
  }

  void changeMode({required bool value}) {
    isDark = value;

    sl<CacheHelper>().put('isDark', isDark);

    emit(ChangeModeState());
  }

  void changeTheme() {
    family = isRtl ? 'Cairo' : 'Poppins';

    lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        systemOverlayStyle: Platform.isIOS
            ? null
            : const SystemUiOverlayStyle(
                statusBarColor: whiteColor,
                statusBarIconBrightness: Brightness.dark,
              ),
        backgroundColor: whiteColor,
        elevation: 0.0,
        titleSpacing: 0.0,
        iconTheme: const IconThemeData(
          size: 20.0,
          color: Colors.black,
        ),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontFamily: family,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: whiteColor,
        elevation: 50.0,
        selectedItemColor: HexColor(mainColor),
        unselectedItemColor: Colors.grey[400],
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(
          height: 1.5,
        ),
      ),
      primarySwatch: const MaterialColor(955, color),
      textTheme: TextTheme(

        headline6: TextStyle(
          fontSize: pxToDp(20.0),
          fontFamily: family,
          color: HexColor(secondaryVariant),
          height: 1.4,
        ),
        bodyText1: TextStyle(
          fontSize: pxToDp(18.0),
          fontFamily: family,
          color: HexColor(secondaryVariant),
          height: 1.4,
        ),
        bodyText2: TextStyle(
          fontSize: pxToDp(16.0),
          fontFamily: family,
          color: HexColor(secondaryVariant),
          height: 1.4,
        ),
        subtitle1: TextStyle(
          fontSize: pxToDp(14.0),
          fontFamily: family,
          color: HexColor(secondaryVariant),
          height: 1.4,
        ),
        subtitle2: TextStyle(
          fontSize: pxToDp(12.0),
          fontFamily: family,
          color: HexColor(secondaryVariant),
          height: 1.4,
        ),
        caption: TextStyle(
          fontSize: pxToDp(10.0),
          fontFamily: family,
          color: HexColor(secondaryVariant),
          height: 1.4,
        ),
        overline: TextStyle(
          fontSize: pxToDp(8.0),
          fontFamily: family,
          color: HexColor(secondaryVariant),
          height: 1.4,
        ),
        button: TextStyle(
          fontSize: pxToDp(16.0),
          fontFamily: family,
          fontWeight: FontWeight.w700,
          color: whiteColor,
          height: 1.4,
        ),
      ),
    );

    darkTheme = ThemeData(
      scaffoldBackgroundColor: HexColor(scaffoldBackgroundDark),
      appBarTheme: AppBarTheme(
        systemOverlayStyle: Platform.isIOS
            ? null
            : SystemUiOverlayStyle(
          statusBarColor: HexColor(scaffoldBackgroundDark),
          statusBarIconBrightness: Brightness.light,
        ),
        backgroundColor: HexColor(scaffoldBackgroundDark),
        elevation: 0.0,
        titleSpacing: 0.0,
        iconTheme: IconThemeData(
          size: 20.0,
          color: HexColor(regularGrey),
        ),
        titleTextStyle: TextStyle(
          color: HexColor(regularGrey),
          fontFamily: family,
          fontWeight: FontWeight.bold,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: HexColor(scaffoldBackgroundDark),
        elevation: 50.0,
        selectedItemColor: HexColor(mainColor),
        unselectedItemColor: HexColor(regularGrey),
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(
          height: 1.5,
        ),
      ),
      primarySwatch: const MaterialColor(955, color),
      textTheme: TextTheme(
        headline6: TextStyle(
          fontSize: pxToDp(20.0),
          fontFamily: family,
          fontWeight: FontWeight.w700,
          color: HexColor(secondaryDark),
        ),
        bodyText1: TextStyle(
          fontSize: pxToDp(16.0),
          fontFamily: family,
          fontWeight: FontWeight.w400,
          color: HexColor(secondaryVariantDark),
        ),
        bodyText2: TextStyle(
          fontSize: pxToDp(14.0),
          fontFamily: family,
          fontWeight: FontWeight.w700,
          color: HexColor(secondaryVariantDark),
        ),
        subtitle1: TextStyle(
          fontSize: pxToDp(12.0),
          fontFamily: family,
          fontWeight: FontWeight.w700,
          color: HexColor(secondaryVariantDark),
        ),
        subtitle2: TextStyle(
          fontSize: pxToDp(12.0),
          fontFamily: family,
          fontWeight: FontWeight.w400,
          color: HexColor(secondaryVariantDark),
        ),
        caption: TextStyle(
          fontSize: pxToDp(11.0),
          fontFamily: family,
          fontWeight: FontWeight.w400,
          color: HexColor(secondaryDark),
        ),
        button: TextStyle(
          fontSize: pxToDp(16.0),
          fontFamily: family,
          fontWeight: FontWeight.w700,
          color: whiteColor,
        ),
      ),
    );

  }

  void setTranslation({
    required String translation,
  }) {
    translationModel = TranslationModel.fromJson(json.decode(
      translation,
    ));

    emit(LanguageLoaded());
  }

  PageController pageController = PageController();

  int currentIndex = 0;

  void bottomChanged(
    int index,
    context,
  ) {
    currentIndex = index;

    pageController.jumpToPage(
      index,
    );

    emit(BottomChanged());
  }

  SelectGovernmentModel selectGovernment = cities[0];
  void changeSelectGovernment({
  required SelectGovernmentModel value,
}){
    selectGovernment = value;
    emit(ChangeSelectGovernment());
  }


  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  LoginModel? loginModel;

  void userLogin() async
  {
    emit(UserLoginLoading());

    final login = await _repository.login(
      email: emailController.text,
      password: passwordController.text,
    );

    login.fold(
            (failure)
        {
          emit(UserLoginError(
              message: failure,
          )
          );
          /// error in failure
          debugPrint(failure.toString());
        },
            (data)
          {

            /// error in data

            loginModel = data;
             emit(UserLoginSuccess(
                 token: loginModel!.token,
             ));

  }
    );

}

  LogOutModel? logOutModel;

  void logOut() async
  {
    emit(UserLogoutLoading());

    final logOut = await _repository.logout();

    logOut.fold(
        (failure)
        {
          emit(UserLogoutError(
              message: failure
          )
          );
        },
        (data)
        {
          logOutModel = data;
          emit(UserLogoutSuccess(
              message: logOutModel!.message,
          )
          );
        }
    );
  }

  final List<String> images = [
    'assets/images/market.png',
    'assets/images/sell.png',
    'assets/images/shopping.png',
  ];
  int currentSliderIndicator = 0;
  void changeSlide() {
    currentSliderIndicator;
    emit(ChangeSlider());
  }

  bool customTileExpanded = false;
  void changeCustomTileExpanded() {
    customTileExpanded;
    emit(ChangeCustomTileExpanded());
  }


}
