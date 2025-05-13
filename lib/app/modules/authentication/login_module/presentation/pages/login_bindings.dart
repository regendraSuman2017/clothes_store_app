import 'package:clothers_store_app/app/modules/authentication/login_module/presentation/pages/login_controller.dart';
import 'package:get/get.dart';


class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}