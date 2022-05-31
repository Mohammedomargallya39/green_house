import 'package:flutter/material.dart';

class ItemModel {
  bool? status;
  String? message;
  List<ProductData>? data;

  ItemModel({this.status, this.message, this.data});

  ItemModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    debugPrint('$status');
    message = json['message'];
    debugPrint(message);
    if (json['data'] != null) {
      data = <ProductData>[];
      json['data'].forEach((v) {
        data!.add(ProductData.fromJson(v));
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

class ProductData {
  String? name;
  String? image;
  String? vedioUrl;
  String? description;
  String? categoryId;
  String? userId;
  String? notes;
  int? id;


  ProductData(
      {
        this.name,
        this.image,
        this.vedioUrl,
        this.description,
        this.categoryId,
        this.userId,
        this.notes,
        this.id
      });

  ProductData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    debugPrint(name);
    image = json['image'];
    debugPrint(image);
    vedioUrl = json['vedio_url'];
    debugPrint(vedioUrl);
    description = json['description'];
    debugPrint(description);
    categoryId = json['category_id'];
    debugPrint(categoryId);
    userId = json['user_id'];
    debugPrint(userId);
    notes = json['notes'];
    debugPrint(notes);
    id = json['id'];
    debugPrint('$id');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    debugPrint(name);
    data['image'] = image;
    debugPrint(image);
    data['vedio_url'] = vedioUrl;
    debugPrint(vedioUrl);
    data['description'] = description;
    debugPrint(description);
    data['category_id'] = categoryId;
    debugPrint(categoryId);
    data['user_id'] = userId;
    debugPrint(userId);
    data['notes'] = notes;
    debugPrint(notes);
    data['id'] = id;
    debugPrint('$id');

    return data;
  }
}
