import 'package:flutter/material.dart';

class ItemModel {
  bool? status;
  String? message;
  List<Data>? data;

  ItemModel({this.status, this.message, this.data});

  ItemModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    debugPrint('$status');
    message = json['message'];
    debugPrint(message);
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
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

class Data {
  String? name;
  String? image;
  String? vedioUrl;
  String? description;
  String? categoryId;
  String? userId;
  String? notes;

  Data(
      {this.name,
        this.image,
        this.vedioUrl,
        this.description,
        this.categoryId,
        this.userId,
        this.notes});

  Data.fromJson(Map<String, dynamic> json) {
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['image'] = image;
    data['vedio_url'] = vedioUrl;
    data['description'] = description;
    data['category_id'] = categoryId;
    data['user_id'] = userId;
    data['notes'] = notes;
    return data;
  }
}