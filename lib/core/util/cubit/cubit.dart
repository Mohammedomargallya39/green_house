import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_house/core/models/item_model.dart';
import 'package:green_house/core/util/cubit/state.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import '../../di/injection.dart';
import '../../models/cart_model.dart';
import '../../models/login_model.dart';
import '../../models/register_model.dart';
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
          debugPrint(failure.toString());
        },
            (data)
          {
            loginModel = data;
             emit(UserLoginSuccess(
                 token: loginModel!.data!.accessToken!,
                 email: loginModel!.data!.email!,
                 name:  loginModel!.data!.name!,
                 points:loginModel!.data!.currentPoints!,
             ));

  }
    );

}


  RegisterModel? registerModel;
  void userRegister(
  {
  required String name,
  required String email,
  required String password,
  required String confirmPassword,
  required String mobile,
  required String address,
  //required String city,
  }) async
  {
    emit(UserRegisterLoading());

    final register = await _repository.register(
      email: email,
      password: password,
      confirmPassword: confirmPassword,
      mobile: mobile,
      address: address,
      name: name,
      //city: city,

    );

    register.fold(
            (failure)
        {
          emit(UserRegisterError(
            message: failure,
          )
          );
          debugPrint(failure.toString());
        },
            (data)
        {
          registerModel = data;
          emit(UserRegisterSuccess(
            token: '${registerModel!.data?.accessToken}',
          ));

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

  int ? numOfProducts = 1;
  void counterPlus() {
    numOfProducts = numOfProducts! + 1;
    emit(NumPlus());
  }
  void counterMin() {
    numOfProducts = numOfProducts! - 1;
    if (numOfProducts! < 1) {
      numOfProducts = 1;
    }
    emit(NumMin());
  }

  int ? numOfProductsInCart = 1;
  int ? productPoints = 55;
  void counterPlusInCart() {
    numOfProductsInCart = numOfProductsInCart! + 1;
    emit(NumPlusInCart());
  }
  void counterMinInCart() {
    numOfProductsInCart = numOfProductsInCart! - 1;
    if (numOfProductsInCart! < 1) {
      numOfProductsInCart = 1;
    }
    emit(NumMinInCart());
  }

  final ImagePicker galleryProduct = ImagePicker();
  File? galleryProductImage;
  void selectGalleryImage() async
  {
    galleryProduct.pickImage(source: ImageSource.gallery).then((value)
    {
      galleryProductImage = File(value!.path);
      emit(SelectGalleryImageState());
    });
  }


  List<ProductData>? displayDevicesItemModel;
  
  void getDisplayDevices() async
  {
    displayDevicesItemModel = null;
    emit(DisplayDevicesItemsLoading());
    displayDevicesItemModel = itemModel!.data!.where(
            (element) => element.categoryId == 'Display Monitors'
    ).toList();
    emit(DisplayDevicesItemsSuccess());
  }

  List<ProductData>? desktopComputersItemModel;

  void getDesktopComputers() async
  {
    desktopComputersItemModel = null;
    emit(DesktopComputersItemsLoading());
    desktopComputersItemModel = itemModel!.data!.where(
            (element) => element.categoryId == 'Desktop Computers'
    ).toList();
    emit(DesktopComputersItemsSuccess());
  }

  List<ProductData>? videoGamingItemModel;

  void getVideoGaming() async
  {
    videoGamingItemModel = null;
    emit(VideoGamingItemsLoading());
    videoGamingItemModel = itemModel!.data!.where(
            (element) => element.categoryId == 'Video Gaming'
    ).toList();
    emit(VideoGamingItemsSuccess());
  }

  List<ProductData>? cellularItemModel;

  void getCellularDevices() async
  {
    cellularItemModel = null;
    emit(CellularDevicesItemsLoading());
    cellularItemModel = itemModel!.data!.where(
            (element) => element.categoryId == 'Cellular Devices'
    ).toList();
    emit(CellularDevicesItemsSuccess());
  }

  ItemModel? itemModel;
  void getItems() async
  {
    itemModel = null;
    emit(UserItemsLoading());
    final items = await _repository.getItems();

    items.fold(
            (failure)
        {
          emit(UserItemsError(
            message: failure,
          )
          );
          debugPrint(failure.toString());
        },
            (data)
        {
          itemModel = data;
          emit(UserItemsSuccess());
          getDisplayDevices();
          getDesktopComputers();
          getVideoGaming();
          getCellularDevices();
        }
    );

  }

  MyCartModel? myCartModel;
  void getCart() async
  {
    myCartModel = null;
    emit(GetCartLoading());
    final cart = await _repository.getCart();

    cart.fold(
            (failure)
        {
          emit(GetCartError(
            message: failure,
          )
          );
          debugPrint(failure.toString());
        },
            (data)
        {
          myCartModel = data;
          emit(GetCartSuccess());
        }
    );

  }

  void addCart(
  {
  required int itemId,
  }) async
  {
    emit(AddCartItemsLoading());
    final items = await _repository.addCart(
        itemId: itemId
    );

    items.fold(
            (failure)
        {
          emit(AddCartItemsError(
            message: failure,
          )
          );
          debugPrint(failure.toString());
        },
            (data)
        {
          emit(AddCartItemsSuccess());
        }
    );

  }

  void makeOrder({
  required String orderId,
}) async
  {
    emit(MakeOrderLoading());
    final items = await _repository.makeOrder(
      orderId: orderId
    );

    items.fold(
            (failure)
        {
          emit(MakeOrderError(
            message: failure,
          )
          );
          debugPrint(failure.toString());
        },
            (data)
        {
          emit(MakeOrderSuccess());
          getCart();
        }
    );

  }


}
