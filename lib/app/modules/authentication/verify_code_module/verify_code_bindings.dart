import 'package:clothers_store_app/app/modules/authentication/verify_code_module/verify_code_controller.dart';
import 'package:get/get.dart';


class VerifyCodeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VerifyCodeController());
  }
}