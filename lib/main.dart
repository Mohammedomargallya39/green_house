import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/di/injection.dart' as di;
import 'core/di/injection.dart';
import 'core/network/local/cache_helper.dart';
import 'core/network/remote/api_endpoints.dart';
import 'core/util/constants.dart';
import 'core/util/cubit/cubit.dart';
import 'core/util/cubit/state.dart';
import 'features/login/presentaion/pages/login_page.dart';
import 'features/main/pages/main_page.dart';
import 'features/no connection/presentation/pages/no_connection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  await di.init();


  bool isRtl = false;

  await sl<CacheHelper>().get('isRtl').then((value) {
    debugPrint('trl ------------- $value');
    if (value != null) {
      isRtl = value;
    }
  });

  bool isDark = false;


  await sl<CacheHelper>().get('isDark').then((value) {
    debugPrint('dark mode in cubit is------------- $value');
    if (value != null) {
      isDark = value;
    }
  });

  String translation = await rootBundle
      .loadString('assets/translations/${isRtl ? 'ar' : 'en'}.json');

  token = await sl<CacheHelper>().get('token');
  debugPrintFullText('My Current Token => $token');

  pointsCached = await sl<CacheHelper>().get('points');
  debugPrintFullText('My Current pointsCached => $pointsCached');

  nameCached = await sl<CacheHelper>().get('name');
  debugPrintFullText('My Current nameCached => $nameCached');

  emailCached = await sl<CacheHelper>().get('email');
  debugPrintFullText('My Current emailCached => $emailCached');

  runApp(MyApp(
    token: token,
    email: emailCached,
    name: nameCached,
    points: pointsCached,
    isRtl: isRtl,
    isDark: isDark,
    translation: translation,
    startWidget: token != null ? const MainPageScreen() :const LoginScreen(),
  ));
}

class MyApp extends StatelessWidget {
  String? token;
  String? name;
  String? email;
  int? points;
  final Widget startWidget;
  final bool isRtl;
  final bool isDark;
  final String translation;

  MyApp({
    Key? key,
    required this.token,
    required this.name,
    required this.email,
    required this.points,
    required this.isRtl,
    required this.isDark,
    required this.translation,
    required this.startWidget,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => sl<AppCubit>()
            ..setThemes(
              dark: isDark,
              rtl: isRtl,
            )..setTranslation(
              translation: translation,
            )..getItems()..getCart(),
        ),
      ],
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          DataConnectionChecker().onStatusChange.listen((status)
          {
            if (status == DataConnectionStatus.disconnected) {
              debugPrint('No internet connection');
            } else {
              debugPrint('Internet connection is available');
            }
            isConnection = status;
            debugPrint('data Connection ${isConnection.toString()}');
          });
          return MaterialApp(
            title: 'Green House',
            debugShowCheckedModeBanner: false,
            themeMode: AppCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            theme: AppCubit.get(context).lightTheme,
            darkTheme: AppCubit.get(context).darkTheme,
            home: isConnection == DataConnectionStatus.disconnected?
            const NoConnectionPage() : startWidget,
            //token != null ? const MainPageScreen() :const LoginScreen() ,
          );
        },
      ),
    );
  }
}
