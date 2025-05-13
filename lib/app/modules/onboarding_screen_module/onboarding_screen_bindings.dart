import 'package:clothers_store_app/app/modules/onboarding_screen_module/onboarding_screen_controller.dart';
import 'package:get/get.dart';

class OnboardingScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardingScreenController());
  }
}