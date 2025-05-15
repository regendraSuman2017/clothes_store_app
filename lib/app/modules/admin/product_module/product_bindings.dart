import 'package:clothers_store_app/app/modules/admin/product_module/product_controller.dart';
import 'package:get/get.dart';

class ProductBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductController());
  }
}