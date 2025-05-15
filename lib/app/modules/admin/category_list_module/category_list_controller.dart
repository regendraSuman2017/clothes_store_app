import 'dart:convert';

import 'package:clothers_store_app/app/core_widget/custome_snackBar.dart';
import 'package:clothers_store_app/app/data/services/api_constant.dart';
import 'package:clothers_store_app/app/modules/admin/category_list_module/data/model/category_model.dart';
import 'package:clothers_store_app/app/modules/admin/category_list_module/data/repositories/category_repo.dart';
import 'package:clothers_store_app/app/modules/admin/category_list_module/data/repositories/category_repo.i.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CategoryListController extends GetxController{

  TextEditingController categoryController = TextEditingController();

  late ICategoryRepo categoryRepo;
  late CategoryModel categoryModel;

  RxBool loader = false.obs;

  XFile? imageFile;

  CategoryListController(){

    categoryRepo = Get.put(CategoryRepoImpl());
     categoryModel   = CategoryModel();
  }

  @override
  void onInit() {
    super.onInit();
  getCategory();
  }

  getCategory() async {
    try{
      loader.value = true;
      final response = await categoryRepo.getCategoryAPI();
      if(response.isSuccess){
          categoryModel = CategoryModel.fromJson( jsonDecode( response.data.toString()));
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


    addCategory() async {
    try {
      final Map<String, dynamic> loginMap = {
        ApiConstant.category : categoryController.text,
      };

      final response = await categoryRepo.addCategoryAPI(loginMap, imageFile!.name, imageFile!.path);

      if (response.isSuccess) {
        Get.snackbar(
          'Success',
          'Category added successfully',
          snackPosition: SnackPosition.BOTTOM,
        );
        categoryController.clear();
        imageFile = null;
        await getCategory();  // Refresh the category list
      } else {
        Get.snackbar(
          'Error',
          'Failed to add category',
          snackPosition: SnackPosition.BOTTOM,
        );
      }

    } catch (e) {
      Get.snackbar(
        'Error',
        'Error adding category: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  final ImagePicker _picker = ImagePicker();

  void takePhoto(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: source);

      if (pickedFile!.path.isNotEmpty) {
          imageFile = pickedFile;
      } else {
      }
    } catch (e) {
    }
  }

}
