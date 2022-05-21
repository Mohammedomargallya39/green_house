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

  UserLoginSuccess({
    required this.token,
  });
}

class UserLoginError extends AppState {
  final String message;

  UserLoginError({
    required this.message,
  });
}

class UserLogoutLoading extends AppState {}

class UserLogoutSuccess extends AppState {
  final String message;

  UserLogoutSuccess({
    required this.message,
  });
}

class UserLogoutError extends AppState {
  final String message;

  UserLogoutError({
    required this.message,
  });
}

class ChangeSlider extends AppState {}

class ChangeCustomTileExpanded extends AppState {}

class NumPlus extends AppState {}

class NumMin extends AppState {}

class NumPlusInCart extends AppState {}

class NumMinInCart extends AppState {}



