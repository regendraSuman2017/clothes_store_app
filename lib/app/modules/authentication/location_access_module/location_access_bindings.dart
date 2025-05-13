import 'package:clothers_store_app/app/modules/authentication/location_access_module/location_access_controller.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class LocationAccessBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LocationAccessController());
  }
}