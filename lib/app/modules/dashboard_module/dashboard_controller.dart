import 'package:clothers_store_app/app/modules/home_module/pages/home_controller.dart';
import 'package:clothers_store_app/app/utils/helpers.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class DashboardController extends GetxController {

  PersistentTabController persistentTabController = PersistentTabController(initialIndex: initialIndex.value);

  HomeController? homePageController;
  DashboardController(){
    homePageController = Get.find<HomeController>();
  }

  @override
  void dispose() {
    super.dispose();
    dispose();
  }
}
