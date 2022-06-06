import 'package:flutter/cupertino.dart';

class OrderDetailsModel {
  bool? status;
  String? message;
  List<Details>? data;

  OrderDetailsModel({this.status, this.message, this.data});

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Details>[];
      json['data'].forEach((v) {
        data!.add(Details.fromJson(v));
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

class Details {
  String? orderId;
  String? itemId;
  String? quantity;
  String? pointsDone;

  Details({this.orderId, this.itemId, this.quantity, this.pointsDone});

  Details.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    debugPrint('order id is =====> $orderId');
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
    debugPrint('order id is =====> $orderId');
    data['item_id'] = itemId;
    debugPrint(itemId);
    data['quantity'] = quantity;
    debugPrint(quantity);
    data['points_done'] = pointsDone;
    debugPrint(pointsDone);
    return data;
  }
}