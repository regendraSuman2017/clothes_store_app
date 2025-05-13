import 'package:clothers_store_app/app/modules/home_module/pages/home_controller.dart';
import 'package:get/get.dart';


class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(() => HomeController());
  }
}