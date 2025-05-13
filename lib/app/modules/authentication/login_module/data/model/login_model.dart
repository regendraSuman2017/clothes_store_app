// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  bool success;
  int status;
  String message;
  Data data;

  LoginModel({
    required this.success,
    required this.status,
    required this.message,
    required this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    success: json["success"],
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  int id;
  String name;
  String email;
  String storeName;
  String profileImage;
  int userRole;
  String token;

  Data({
    required this.id,
    required this.name,
    required this.email,
    required this.storeName,
    required this.profileImage,
    required this.userRole,
    required this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    storeName: json["storeName"],
    profileImage: json["profile_image"],
    userRole: json["userRole"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "storeName": storeName,
    "profile_image": profileImage,
    "userRole": userRole,
    "token": token,
  };
}
