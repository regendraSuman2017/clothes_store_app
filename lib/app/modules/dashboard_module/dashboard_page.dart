import 'package:clothers_store_app/app/modules/authentication/login_module/presentation/pages/login_page.dart';
import 'package:clothers_store_app/app/modules/cart_list_module/cart_list_page.dart';
import 'package:clothers_store_app/app/modules/dashboard_module/dashboard_controller.dart';
import 'package:clothers_store_app/app/modules/home_module/pages/home_page.dart';
import 'package:clothers_store_app/app/modules/setting_module/setting_page.dart';
import 'package:clothers_store_app/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

// ignore: must_be_immutable
class DashboardPage extends GetView<DashboardController> {
  @override
  final controller = Get.find<DashboardController>();
  DashboardPage({super.key});
  @override
  Widget build(BuildContext context) {
    return PopScope(
        onPopInvokedWithResult: (didPop,dynamic) {},
        child:  PersistentTabView(
          floatingActionButton: null,
          navBarHeight: Get.height*0.09,
          controller: controller.persistentTabController,
          stateManagement: true,
          popAllScreensOnTapOfSelectedTab: false,
          popActionScreens: PopActionScreensType.all,
          screenTransitionAnimation: const ScreenTransitionAnimation.none(),
          tabs: _navBarsItems(),
          onTabChanged: (value) {
          },
          navBarBuilder: (navBarConfig) => Style1BottomNavBar(
            navBarConfig: navBarConfig,
          ),

        )
    );
  }

  List<PersistentTabConfig> _navBarsItems() {
    return [
      PersistentTabConfig(
        item: ItemConfig(
          activeForegroundColor: primaryColor,
          inactiveForegroundColor: blackBase,
          icon: Icon(Icons. home),
          title: 'Home',
        ),
        screen:  HomePage(),
      ),

      PersistentTabConfig(
        item: ItemConfig(
          activeForegroundColor: primaryColor,
          inactiveForegroundColor: blackBase,
          icon: Icon(Icons.shopping_basket_rounded),
          title: 'Card',
        ),
        screen: CartListPage(),
      ),

      PersistentTabConfig(
        screen: LoginPage(),
        item: ItemConfig(
          activeForegroundColor: primaryColor,
          inactiveForegroundColor:blackBase,
          icon: Icon(Icons.favorite),
          title: 'Favourite',
          // title: ("OnHomeHomeButton".tr),
        ),
      ),

      PersistentTabConfig(
        item: ItemConfig(
          activeForegroundColor: primaryColor,
          inactiveForegroundColor: blackBase,
          icon: Icon(Icons.person),
          title: 'Setting',
        ),
        screen:  SettingPage(),
      ),
    ];
  }
}










