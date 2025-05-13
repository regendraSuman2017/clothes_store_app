import 'package:clothers_store_app/app/modules/splash_screen_module/splash_screen_controller.dart';
import 'package:get/get.dart';


class SplashScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.put( SplashScreenController());
  }
}