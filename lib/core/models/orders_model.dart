import 'package:flutter/material.dart';

class MyOrdersModel {
  bool? status;
  String? message;
  List<OrderBaseData>? data;

  MyOrdersModel({this.status, this.message, this.data});

  MyOrdersModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <OrderBaseData>[];
      json['data'].forEach((v) {
        data!.add(OrderBaseData.fromJson(v));
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

class OrderBaseData {
  String? orderDate;
  String? statusId;
  String? userId;
  String? notes;
  List<OrderDetails>? items;

  OrderBaseData({this.orderDate, this.statusId, this.userId, this.notes, this.items});

  OrderBaseData.fromJson(Map<String, dynamic> json) {
    orderDate = json['order_date'];
    debugPrint(orderDate);
    statusId = json['status_id'];
    debugPrint(statusId);
    userId = json['user_id'];
    debugPrint(userId);
    notes = json['notes'];
    debugPrint(notes);
    if (json['items'] != null) {
      items = <OrderDetails>[];
      json['items'].forEach((v) {
        items!.add(OrderDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_date'] = orderDate;
    debugPrint(orderDate);
    data['status_id'] = statusId;
    debugPrint(statusId);
    data['user_id'] = userId;
    debugPrint(userId);
    data['notes'] = notes;
    debugPrint(notes);
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderDetails {
  String? orderId;
  String? itemId;
  String? quantity;
  String? pointsDone;

  OrderDetails({this.orderId, this.itemId, this.quantity, this.pointsDone});

  OrderDetails.fromJson(Map<String, dynamic> json) {
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