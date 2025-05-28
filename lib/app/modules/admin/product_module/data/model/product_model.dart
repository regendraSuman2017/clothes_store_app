// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  bool success;
  String message;
  List<Datums> data;

  ProductModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    success: json["success"],
    message: json["message"],
    data: List<Datums>.from(json["data"].map((x) => Datums.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datums {
  int id;
  int catId;
  String productName;
  int price;
  String description;
  int stock;
  String category;
  String image;
  String categoryName;

  Datums({
    required this.id,
    required this.catId,
    required this.productName,
    required this.price,
    required this.description,
    required this.stock,
    required this.category,
    required this.image,
    required this.categoryName,
  });

  factory Datums.fromJson(Map<String, dynamic> json) => Datums(
    id: json["id"],
    catId: json["cat_id"],
    productName: json["productName"],
    price: json["price"],
    description: json["description"],
    stock: json["stock"],
    category: json["category"],
    image: json["image"],
    categoryName: json["categoryName"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "cat_id": catId,
    "productName": productName,
    "price": price,
    "description": description,
    "stock": stock,
    "category": category,
    "image": image,
    "categoryName": categoryName,
  };
}
