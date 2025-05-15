import 'package:clothers_store_app/app/modules/admin/product_module/product_bindings.dart';
import 'package:clothers_store_app/app/modules/admin/product_module/product_page.dart';
import '../../app/modules/setting_module/setting_page.dart';
import '../../app/modules/setting_module/setting_bindings.dart';
import 'package:clothers_store_app/app/modules/admin/category_list_module/category_list_bindings.dart';
import 'package:clothers_store_app/app/modules/admin/category_list_module/category_list_page.dart';
import 'package:clothers_store_app/app/modules/profile/profile_module/profile_bindings.dart';
import 'package:clothers_store_app/app/modules/profile/profile_module/profile_page.dart';
import '../../app/modules/cart_list_module/cart_list_page.dart';
import '../../app/modules/cart_list_module/cart_list_bindings.dart';
import 'package:clothers_store_app/app/modules/authentication/location_access_module/location_access_bindings.dart';
import 'package:clothers_store_app/app/modules/authentication/location_access_module/location_access_page.dart';
import 'package:clothers_store_app/app/modules/authentication/login_module/presentation/pages/login_bindings.dart';
import 'package:clothers_store_app/app/modules/authentication/login_module/presentation/pages/login_page.dart';
import 'package:clothers_store_app/app/modules/authentication/sign_up_module/pages/sign_up_bindings.dart';
import 'package:clothers_store_app/app/modules/authentication/sign_up_module/pages/sign_up_page.dart';
import 'package:clothers_store_app/app/modules/dashboard_module/dashboard_bindings.dart';
import 'package:clothers_store_app/app/modules/dashboard_module/dashboard_page.dart';
import 'package:clothers_store_app/app/modules/home_module/pages/home_bindings.dart';
import 'package:clothers_store_app/app/modules/home_module/pages/home_page.dart';
import 'package:clothers_store_app/app/modules/onboarding_screen_module/onboarding_screen_bindings.dart';
import 'package:clothers_store_app/app/modules/onboarding_screen_module/onboarding_screen_page.dart';
import 'package:clothers_store_app/app/modules/product_detail_module/product_detail_bindings.dart';
import 'package:clothers_store_app/app/modules/product_detail_module/product_detail_page.dart';
import 'package:clothers_store_app/app/modules/splash_screen_module/splash_screen_bindings.dart';
import 'package:clothers_store_app/app/modules/splash_screen_module/splash_screen_page.dart';
import 'package:clothers_store_app/app/modules/welcome_screen_module/welcome_screen_bindings.dart';
import 'package:clothers_store_app/app/modules/welcome_screen_module/welcome_screen_page.dart';
import 'package:clothers_store_app/app/routes/app_routes.dart';
import 'package:get/get.dart';

List<GetPage> getPages = [
    GetPage(
      name: Routes.splashPage,
      page: () => SplashScreenPage(),
      binding: SplashScreenBindings(),
    ),
    GetPage(
      name: Routes.loginPage,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.welcomeScreen,
      page: () => WelcomeScreenPage(),
      binding: WelcomeScreenBinding(),
    ),
    GetPage(
      name: Routes.onboardingScreen,
      page: () =>   OnboardingScreenPage(),
      binding: OnboardingScreenBinding(),
    ),
    GetPage(
      name: Routes.signUpPage,
      page: () => SignUpPage(),
      binding: SignUpBinding(),
    ),

    GetPage(
      name: Routes.dashboard,
      page: () => DashboardPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: Routes.homePage,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.productDetails,
      page: () => ProductDetailPage(),
      binding: ProductDetailBinding(),
    ),

    GetPage(
      name: Routes.locationAccess,
      page: () => LocationAccessPage(),
      binding: LocationAccessBinding(),
    ),
    GetPage(
      name: Routes.cartList,
      page: () => CartListPage(),
      binding: CartListBinding(),
    ),
    GetPage(
      name: Routes.profilePage,
      page: () => ProfilePage(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.categoryList,
      page: () => CategoryListPage(),
      binding: CategoryListBinding(),
    ),
    GetPage(
      name: Routes.SETTING,
      page: () => SettingPage(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: Routes.productList,
      page: () => ProductPage(),
      binding: ProductBinding(),
    ),
  ];

