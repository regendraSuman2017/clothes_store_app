import 'package:clothers_store_app/app/modules/admin/category_list_module/category_list_controller.dart';
import 'package:get/get.dart';

class CategoryListBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CategoryListController());
  }
}