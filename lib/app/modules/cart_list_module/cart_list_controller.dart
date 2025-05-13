import 'package:clothers_store_app/app/data/services/cart_item.dart';
import 'package:get/get.dart';
class CartListController extends GetxController{

  Future<List<CartItem>> getProducts() async {
    CartItem cartItem = CartItem();
    var fasf= await cartItem.getProducts();
return fasf;

  }
}
