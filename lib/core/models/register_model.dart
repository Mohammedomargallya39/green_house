class RegisterModel {
  bool? status;
  String? message;
  Data? data;

  RegisterModel({this.status, this.message, this.data});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? name;
  String? email;
  String? city;
  String? address;
  String? mobile;
  int? currentPoints;
  String? accessToken;

  Data(
      {this.name,
        this.email,
        this.city,
        this.address,
        this.mobile,
        this.currentPoints,
        this.accessToken});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    city = json['city'];
    address = json['address'];
    mobile = json['mobile'];
    currentPoints = json['current_points'];
    accessToken = json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['city'] = city;
    data['address'] = address;
    data['mobile'] = mobile;
    data['current_points'] = currentPoints;
    data['accessToken'] = accessToken;
    return data;
  }
}