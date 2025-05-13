import 'package:clothers_store_app/app/modules/cart_list_module/cart_list_controller.dart';
import 'package:clothers_store_app/app/modules/dashboard_module/dashboard_controller.dart';
import 'package:clothers_store_app/app/modules/home_module/pages/home_controller.dart';
import 'package:get/get.dart';

class DashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CartListController());
    Get.lazyPut(()=>HomeController());
    Get.lazyPut(() => DashboardController());
  }
}