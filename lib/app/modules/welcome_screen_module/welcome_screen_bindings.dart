import 'package:clothers_store_app/app/modules/welcome_screen_module/welcome_screen_controller.dart';
import 'package:get/get.dart';


class WelcomeScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WelcomeScreenController());
  }
}