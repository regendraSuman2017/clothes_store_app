import 'dart:convert';

List<ProductModel> productModelFromJson(String str) =>
    List<ProductModel>.from(json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  int? id;
  String? title;
  String? slug;
  int? price;
  String? description;
  Category? category;
  List<String>? images;
  DateTime? creationAt;
  DateTime? updatedAt;

  ProductModel({
    this.id,
    this.title,
    this.slug,
    this.price,
    this.description,
    this.category,
    this.images,
    this.creationAt,
    this.updatedAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"],
    title: json["title"],
    slug: json["slug"],
    price: json["price"],
    description: json["description"],
    category: json["category"] != null ? Category.fromJson(json["category"]) : null,
    images: json["images"] != null
        ? List<String>.from(json["images"].map((x) => x))
        : [],
    creationAt: json["creationAt"] != null ? DateTime.parse(json["creationAt"]) : null,
    updatedAt: json["updatedAt"] != null ? DateTime.parse(json["updatedAt"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "slug": slug,
    "price": price,
    "description": description,
    "category": category?.toJson(),
    "images": images != null ? List<dynamic>.from(images!.map((x) => x)) : [],
    "creationAt": creationAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

class Category {
  int? id;
  Name? name;
  Slug? slug;
  String? image;
  DateTime? creationAt;
  DateTime? updatedAt;

  Category({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.creationAt,
    this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: nameValues.map[json["name"]],
    slug: slugValues.map[json["slug"]],
    image: json["image"],
    creationAt: json["creationAt"] != null ? DateTime.parse(json["creationAt"]) : null,
    updatedAt: json["updatedAt"] != null ? DateTime.parse(json["updatedAt"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": nameValues.reverse[name],
    "slug": slugValues.reverse[slug],
    "image": image,
    "creationAt": creationAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

enum Name { CLOTHES, ELECTRONICS, FURNITURE, MISCELLANEOUS, SHOES }

final nameValues = EnumValues({
  "Clothes": Name.CLOTHES,
  "Electronics": Name.ELECTRONICS,
  "Furniture": Name.FURNITURE,
  "Miscellaneous": Name.MISCELLANEOUS,
  "Shoes": Name.SHOES
});

enum Slug { CLOTHES, ELECTRONICS, FURNITURE, MISCELLANEOUS, SHOES }

final slugValues = EnumValues({
  "clothes": Slug.CLOTHES,
  "electronics": Slug.ELECTRONICS,
  "furniture": Slug.FURNITURE,
  "miscellaneous": Slug.MISCELLANEOUS,
  "shoes": Slug.SHOES
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
