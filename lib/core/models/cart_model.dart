import 'package:flutter/cupertino.dart';

class MyCartModel {
  bool? status;
  String? message;
  List<Cart>? data;

  MyCartModel({this.status, this.message, this.data});

  MyCartModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Cart>[];
      json['data'].forEach((v) {
        data!.add(Cart.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cart {
  String? orderId;
  String? itemId;
  String? quantity;
  String? pointsDone;

  Cart({this.orderId, this.itemId, this.quantity, this.pointsDone});

  Cart.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    debugPrint(orderId);
    itemId = json['item_id'];
    debugPrint(itemId);
    quantity = json['quantity'];
    debugPrint(quantity);
    pointsDone = json['points_done'];
    debugPrint(pointsDone);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_id'] = orderId;
    debugPrint(orderId);
    data['item_id'] = itemId;
    debugPrint(itemId);
    data['quantity'] = quantity;
    debugPrint(quantity);
    data['points_done'] = pointsDone;
    debugPrint(pointsDone);

    return data;
  }
}