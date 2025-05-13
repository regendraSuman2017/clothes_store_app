import 'package:clothers_store_app/app/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenController extends GetxController {

  // Simulate user login status & role
  RxBool isLoggedIn = false.obs; // Example: fetch from storage/service
   RxInt userRole = 0.obs; // Possible values: 'admin', 'user'

  @override
  Future<void> onInit() async {
    super.onInit();
    SharedPreferences prefs = await SharedPreferences.getInstance();
     isLoggedIn.value = prefs.getBool('isLoggedIn') ?? false;
  }

  @override
  Future<void> onReady() async {
    super.onReady();

    await Future.delayed(const Duration(seconds: 3), () {
      if (isLoggedIn.value) {
        Get.offAllNamed(Routes.dashboard);
        /*if (userRole.value == 1) {
          Get.offAllNamed(Routes.adminDashboard);
        } else if (userRole.value == 0) {
          Get.offAllNamed(Routes.userHome);
        } else {
          Get.offAllNamed(Routes.welcomeScreen);
        }*/
      } else {
        Get.offAllNamed(Routes.welcomeScreen);
      }
    });
  }
}
