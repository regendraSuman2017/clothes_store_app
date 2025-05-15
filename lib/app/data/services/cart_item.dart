import 'package:clothers_store_app/app/data/database_service.dart';

class CartItem {
  int? id;
  String? productId;
  String? name;
  String? price;
  int? quantity;
  String? imageUrl;

  CartItem({
    this.id,
     this.productId,
     this.name,
     this.price,
     this.quantity,
     this.imageUrl,
  });

  // Convert to Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'productId': productId,
      'name': name,
      'price': price,
      'quantity': quantity,
      'imageUrl': imageUrl,
    };
  }

  // Convert from Map
  CartItem.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    productId = map['productId'];
    name = map['name'];
    price = map['price'];
    quantity = map['quantity'];
    imageUrl = map['imageUrl'];
  }

  // Save to local SQLite DB
  Future<int> saveToDB() async {
    DBHelper dbHelper = DBHelper();
    var dbClient = await dbHelper.database;
    return await dbClient.insert('cart_items', toMap());
  }

  Future<List<CartItem>> getProducts() async {
    DBHelper dbHelper = DBHelper();
    var dbClient = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await dbClient.query('cart_items');

    return maps.map((map) => CartItem.fromMap(map)).toList();
  }

}
