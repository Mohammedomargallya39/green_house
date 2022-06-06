import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:green_house/core/network/remote/api_endpoints.dart';
import 'package:green_house/core/network/remote/dio_helper.dart';
import '../error/exceptions.dart';
import '../models/cart_model.dart';
import '../models/item_model.dart';
import '../models/login_model.dart';
import '../models/order_details_model.dart';
import '../models/orders_model.dart';
import '../models/register_model.dart';
import 'local/cache_helper.dart';

abstract class Repository {

  Future<Either<String, LoginModel>> login({
    required String email,
    required String password,
  });

  Future<Either<String, void>> addCart({
    required int itemId,
  });

  Future<Either<String, void>> makeOrder({
    required String orderId
  });

  Future<Either<String, MyCartModel>> getCart();

  Future<Either<String, MyOrdersModel>> getOrders();

  Future<Either<String, OrderDetailsModel>> getOrderDetails(
  {
    required String orderId
  });

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
  Future<Either<String, void>> addCart(
      {
        required int itemId,
      }
      ) async
  { return _basicErrorHandling<void>(
      onSuccess: () async
      {
        final Response f = await dioHelper.post(
            url: addToCartUrl,
            token: token,
            data: {
              'item_id': itemId,
            }
        );
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
  Future<Either<String, void>> makeOrder(
  {
    required String orderId
  }
      ) async
  { return _basicErrorHandling<void>(
      onSuccess: () async
      {
        final Response f = await dioHelper.post(
            url: makeOrderUrl,
            token: token,
            data:
            {
              'order_id': orderId,
            }
        );
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
            token: token,
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

  @override
  Future<Either<String, MyCartModel>> getCart() async
  { return _basicErrorHandling<MyCartModel>(
      onSuccess: () async
      {
        final Response f = await dioHelper.get(
          token: token,
          url: getCartUrl,
        );

        return MyCartModel.fromJson(f.data);
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
  Future<Either<String, MyOrdersModel>> getOrders() async
  { return _basicErrorHandling<MyOrdersModel>(
      onSuccess: () async
      {
        final Response f = await dioHelper.get(
          url: showOrdersUrl,
          token: token,
        );

        return MyOrdersModel.fromJson(f.data);
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
  Future<Either<String, OrderDetailsModel>> getOrderDetails({
  required String orderId
}) async
  { return _basicErrorHandling<OrderDetailsModel>(
      onSuccess: () async
      {
        final Response f = await dioHelper.get(
          url: '$showOrderDetailsUrl$orderId',
          token: token,
        );

        return OrderDetailsModel.fromJson(f.data);
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
