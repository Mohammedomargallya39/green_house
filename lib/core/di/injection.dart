import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../network/local/cache_helper.dart';
import '../network/remote/dio_helper.dart';
import '../network/repository.dart';
import '../util/cubit/cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Number Trivia
  // Bloc

  sl.registerFactory(
    () => AppCubit(
      repository: sl(),
    ),
  );

  // Use cases

  // Repository
  sl.registerLazySingleton<Repository>(
        () => RepoImplementation(
      dioHelper: sl(),
      cacheHelper: sl(),
    ),
  );

  // Data sources

  // Core
  sl.registerLazySingleton<DioHelper>(
    () => DioImpl(),
  );

  sl.registerLazySingleton<CacheHelper>(
    () => CacheImpl(
      sl(),
    ),
  );

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
