import 'dart:convert';
import 'package:clothers_store_app/app/data/services/cart_item.dart';
import 'package:clothers_store_app/app/modules/product_detail_module/data/model/product_detail_model.dart';
import 'package:clothers_store_app/app/modules/product_detail_module/data/repositories/product_detail_repo.dart';
import 'package:clothers_store_app/app/modules/product_detail_module/data/repositories/product_detail_repo.i.dart';
import 'package:get/get.dart';

class ProductDetailController extends GetxController {
  late IProductDetailRepo productDetailsRepo;
  ProductDetailModel? productDetailModel;
  RxBool loading = false.obs;
  ProductDetailController() {
    productDetailsRepo = Get.put(ProductDetailRepoImpl());
  }
  dynamic argument;
  @override
  void onInit() {
    super.onInit();
    argument = Get.arguments['product'];
    fetchProductById(argument.id);
  }

  fetchProductById(argument) async {
    try {
      loading.value = true;
      final response = await productDetailsRepo.fetchProductById(argument.toString());

      if (response.isSuccess) {

        productDetailModel = ProductDetailModel.fromJson(jsonDecode(response.data.toString()));

      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Error: $e');
    } finally {
      loading.value = false;
    }
  }

  Future<void> loadCartItems() async {
    CartItem cartItem = CartItem(
      name: argument.title,
      imageUrl: argument.images[0],
      price: argument.price.toString(),
      productId: argument.id.toString(),
      quantity: 1,
    );
    cartItem.saveToDB();
  }
}
