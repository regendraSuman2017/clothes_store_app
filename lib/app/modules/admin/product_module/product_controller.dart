import 'dart:convert';

import 'package:clothers_store_app/app/core_widget/custome_snackBar.dart';
import 'package:clothers_store_app/app/modules/admin/category_list_module/category_list_controller.dart';
import 'package:clothers_store_app/app/modules/admin/category_list_module/data/model/category_model.dart';
import 'package:clothers_store_app/app/modules/admin/category_list_module/data/repositories/category_repo.dart';
import 'package:clothers_store_app/app/modules/admin/category_list_module/data/repositories/category_repo.i.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProductController extends GetxController{

  late final CategoryListController? categoryListController;

  ProductController(){
    categoryListController = Get.find<CategoryListController>();
  }
TextEditingController productController = TextEditingController();
TextEditingController categoryController = TextEditingController();
  late ICategoryRepo categoryRepo;
  late CategoryModel categoryModel;
  RxBool loader = false.obs;
  @override
  void onInit() {
    super.onInit();
    categoryRepo = Get.put(CategoryRepoImpl());
    categoryModel   = CategoryModel();
    getCategory();
  }

  getCategory() async {
    try{
      loader.value = true;
      final response = await categoryRepo.getCategoryAPI();
      print("djasdh ${response.statusCode}");
      print("djasdh ${categoryModel}");
      if(response.isSuccess){
        categoryModel = CategoryModel.fromJson( jsonDecode( response.data.toString()));
        print("djasdh ${categoryModel}");
      }else if(response.statusCode==498){
        showWarningSnackBar(message: "Session expired. Please log in again.");
      }

    }catch(e){
      if (kDebugMode) {
        print(e);
      }
    }finally{
      loader.value = false;
    }
  }

XFile? imageFile;
final ImagePicker _picker = ImagePicker();
addProduct(){}
void takePhoto(ImageSource source) async {
  try {
    final XFile? pickedFile = await _picker.pickImage(source: source);

    if (pickedFile!.path.isNotEmpty) {
      imageFile = pickedFile;
    } else {
    }
  } catch (e) {
    if (kDebugMode) {
      print('Error picking image: $e');
    }
  }
}

}
