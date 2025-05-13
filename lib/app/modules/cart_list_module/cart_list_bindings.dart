import 'package:clothers_store_app/app/modules/cart_list_module/cart_list_controller.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class CartListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CartListController());
  }
}