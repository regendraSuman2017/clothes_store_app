// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  bool? success;
  int? statusCode;
  String? message;
  List<Datum>? data;

  CategoryModel({
     this.success,
     this.statusCode,
     this.message,
     this.data,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    success: json["success"] as bool?,
    statusCode: json["statusCode"] as int?,
    message: json["message"] as String?,
    data: json["data"] != null
        ? List<Datum>.from((json["data"] as List).map((x) => Datum.fromJson(x as Map<String, dynamic>)))
        : null,
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "statusCode": statusCode,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  final int id;
  final String categoryName;
  final String image;

  Datum({
    required this.id,
    required this.categoryName,
    required this.image,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"] as int? ?? 0,
    categoryName: json["categoryName"] as String? ?? 'Unknown',
    image: json["image"] as String? ?? '',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "categoryName": categoryName,
    "image": image,
  };
}


