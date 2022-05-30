import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:green_house/core/network/remote/api_endpoints.dart';
import 'package:green_house/core/network/remote/dio_helper.dart';
import '../error/exceptions.dart';
import '../models/item_model.dart';
import '../models/login_model.dart';
import '../models/register_model.dart';
import 'local/cache_helper.dart';

abstract class Repository {
  Future<Either<String, LoginModel>> login({
    required String email,
    required String password,
  });

  // Future<Either<String, LogOutModel>> logout();

  Future<Either<String, RegisterModel>> register({
    required String name,
    required String email,
    required String address,
    required String mobile,
    required String password,
    required String confirmPassword,
    //required String city,
  });

  Future<Either<String, ItemModel>> getItems();

}

class RepoImplementation extends Repository {
  final DioHelper dioHelper;
  final CacheHelper cacheHelper;

  RepoImplementation({
    required this.dioHelper,
    required this.cacheHelper,
  });

  @override
  Future<Either<String, LoginModel>> login(
      {
        required String email,
        required String password
      }
      ) async
  { return _basicErrorHandling<LoginModel>(
      onSuccess: () async
      {
        final Response f = await dioHelper.post(
            url: loginUrl,
            data: {
              'email': email,
              'password': password,
            }
        );

        return LoginModel.fromJson(f.data);
      },
      onServerError: (exception) async
  {
    debugPrint(exception.message);
    return exception.message;
  }
  );

    // TODO: implement login
    throw UnimplementedError();
  }


  @override
  Future<Either<String, RegisterModel>> register(
      {
        required String name,
        required String email,
        required String address,
        required String mobile,
        required String password,
        required String confirmPassword,
        //required String city,

      }
      ) async
  { return _basicErrorHandling<RegisterModel>(
      onSuccess: () async
      {
        final Response f = await dioHelper.post(
            url: registerUrl,
            data: {
              'name': name,
              'email': email,
              'password': password,
              'c_password': confirmPassword,
              'mobile': mobile,
              'address': address,
              //'city': city,
            }
        );

        return RegisterModel.fromJson(f.data);
      },
      onServerError: (exception) async
      {
        debugPrint(exception.message);
        return exception.message;
      }
  );

  // TODO: implement login
  throw UnimplementedError();
  }

  @override
  Future<Either<String, ItemModel>> getItems() async
  { return _basicErrorHandling<ItemModel>(
      onSuccess: () async
      {
        final Response f = await dioHelper.get(
            token: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMjJhN2I2NmUyZDFiMjZhMDQ2MWRhZTk1OThjMTVhZjk5NTIxNjY2MTAwZjMzNmIwOWEwNTZiY2VlMzViMjA3YWQ1MGI5ZjZjMTI2NWM4YzMiLCJpYXQiOjE2NTM5MjQ3ODcuNDg1OTcsIm5iZiI6MTY1MzkyNDc4Ny40ODU5NzMsImV4cCI6MTY4NTQ2MDc4Ny40NzgyNzksInN1YiI6IjE4Iiwic2NvcGVzIjpbXX0.adjgKebVCTBZGxXbrfORqKg4o2DeKnGHjmFgenoNsgIw2ftoakb3c1mbjkRIOQoefMXoFq3BBk75U9mNgQo9j6Vy0nbwN8ZM1tK-asYpH8EKdzf0NK06O6J3MGyPJ3p6zu36Kk-iOdkdXqf5JQzc7Ld222ACpxQlcQXKOSByY8EG8akAlGyEM9O87GmBqpFVr-JV-COUNkg6aasgGKqKnlvLlIbPaECRYfoFH6DJhuXc5SgoADBGT0neVpsLDagmRCn0UGtZBUUI4wPFyTxQFfzp69Y6NDl1qBHiT4V9x5_QPBk4iv19xjsg3yLXdPKgaYAr895lOXj0dVFVljZ96v0VqtYYMasIpiNuu0M0T982qbIJ-JNo-wyIAD3jbBuCF7MHWpuGSUvaqd6HhzRO8BWCsIyJpY5Ok9kPcE3nRviNujE9h4FVEgfitxTKcv23N8RuSdUwIcNOYVD85EQ78z_wNHPl9HvqdP5bGrXwphqy5l4WA-6uhHJ11HQW7iIliBUwcHwVMb3wPfGhKmaFYTYvzZTtj27RlXDQbEn6qflSUqiauArlONlkw0yKvVnO92uAou-o52QeO1Qp6DECvVh4nNeDYOLCFHzJH3dVX-SwffkAwkvfB75xmpkjAz8m5tKc50mt1oNwck7iTp0ggixOh2yx6Tf98GXsr2U20fU',
            url: getItemsUrl,
        );

        return ItemModel.fromJson(f.data);
      },
      onServerError: (exception) async
      {
        debugPrint(exception.message);
        return exception.message;
      }
  );

  // TODO: implement login
  throw UnimplementedError();
  }
}


extension on Repository {

  Future<Either<String, T>> _basicErrorHandling<T>({
    required Future<T> Function() onSuccess,
    Future<String> Function(ServerException exception)? onServerError,
    Future<String> Function(CacheException exception)? onCacheError,
    Future<String> Function(dynamic exception)? onOtherError,
  }) async {
    try {
      final f = await onSuccess();
      return Right(f);
    } on ServerException catch (e, s) {
      // recordError(e, s);
      debugPrint(s.toString());
      if (onServerError != null) {
        final f = await onServerError(e);
        return Left(f);
      }
      return const Left('Server Error');
    } on CacheException catch (e) {
      // recordError(e, s);
      debugPrint(e.toString());
      if (onCacheError != null) {
        final f = await onCacheError(e);
        return Left(f);
      }
      return const Left('Cache Error');
    } catch (e, s) {
      // recordError(e, s);
      debugPrint(s.toString());
      if (onOtherError != null) {
        final f = await onOtherError(e);
        return Left(f);
      }
      return Left(e.toString());
    }
  }
}
