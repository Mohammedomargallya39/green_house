import 'package:meta/meta.dart';

@immutable
abstract class AppState {}

class Empty extends AppState {}

class Loading extends AppState {}

class Loaded extends AppState {}

class Error extends AppState {}

class ThemeLoaded extends AppState {}

class ChangeModeState extends AppState {}

class ChangeLanguageState extends AppState {}

class LanguageLoaded extends AppState {}

class ChangeLoaded extends AppState {}

class BottomChanged extends AppState {}

class UserChangeLoginSuffixState extends AppState {}

class ChangeSelectGovernment extends AppState {}

class UserLoginLoading extends AppState {}

class UserLoginSuccess extends AppState {
  final String token;
  final int points;
  final String name;
  final String email;



  UserLoginSuccess({
    required this.token,
    required this.points,
    required this.name,
    required this.email,
  });
}

class UserLoginError extends AppState {
  final String message;

  UserLoginError({
    required this.message,
  });
}

class UserRegisterLoading extends AppState {}

class UserRegisterSuccess extends AppState {
  final String token;

  UserRegisterSuccess({
    required this.token,
  });
}

class UserRegisterError extends AppState {
  final String message;

  UserRegisterError({
    required this.message,
  });
}

// class UserLogoutLoading extends AppState {}
//
// class UserLogoutSuccess extends AppState {
//   final String message;
//
//   UserLogoutSuccess({
//     required this.message,
//   });
// }
//
// class UserLogoutError extends AppState {
//   final String message;
//
//   UserLogoutError({
//     required this.message,
//   });
// }

class ChangeSlider extends AppState {}

class ChangeCustomTileExpanded extends AppState {}

class NumPlus extends AppState {}

class NumMin extends AppState {}

class NumPlusInCart extends AppState {}

class NumMinInCart extends AppState {}

class SelectCameraImageSate extends AppState {}

class SelectGalleryImageState extends AppState {}


class UserItemsLoading extends AppState {}

class UserItemsSuccess extends AppState {}

class UserItemsError extends AppState {
  final String message;

  UserItemsError({
    required this.message,
  });
}

class GetCartLoading extends AppState {}

class GetCartSuccess extends AppState {}

class GetCartError extends AppState {
  final String message;

  GetCartError({
    required this.message,
  });
}

class GetOrdersLoading extends AppState {}

class GetOrdersSuccess extends AppState {}

class GetOrdersError extends AppState {
  final String message;

  GetOrdersError({
    required this.message,
  });
}

class GetOrderDetailsLoading extends AppState {}

class GetOrderDetailsSuccess extends AppState {}

class GetOrderDetailsError extends AppState {
  final String message;

  GetOrderDetailsError({
    required this.message,
  });
}

class DisplayDevicesItemsLoading extends AppState {}

class DisplayDevicesItemsSuccess extends AppState {}

class DesktopComputersItemsLoading extends AppState {}

class DesktopComputersItemsSuccess extends AppState {}

class VideoGamingItemsLoading extends AppState {}

class VideoGamingItemsSuccess extends AppState {}

class CellularDevicesItemsLoading extends AppState {}

class CellularDevicesItemsSuccess extends AppState {}

class AddCartItemsLoading extends AppState {}

class AddCartItemsSuccess extends AppState {}

class AddCartItemsError extends AppState {
  final String message;

  AddCartItemsError({
    required this.message,
  });
}

class MakeOrderLoading extends AppState {}

class MakeOrderSuccess extends AppState {}

class MakeOrderError extends AppState {
  final String message;

  MakeOrderError({
    required this.message,
  });
}





