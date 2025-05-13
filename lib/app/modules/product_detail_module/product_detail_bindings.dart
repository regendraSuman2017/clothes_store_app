import 'package:clothers_store_app/app/modules/product_detail_module/product_detail_controller.dart';
import 'package:get/get.dart';

class ProductDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ProductDetailController());
  }
}