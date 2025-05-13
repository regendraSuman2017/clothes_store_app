import 'package:clothers_store_app/app/core_widget/custome_snackBar.dart';
import 'package:clothers_store_app/app/data/services/api_constant.dart';
import 'package:clothers_store_app/app/modules/admin/category_list_module/data/repositories/category_repo.dart';
import 'package:clothers_store_app/app/modules/admin/category_list_module/data/repositories/category_repo.i.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CategoryListController extends GetxController{

  TextEditingController categoryController = TextEditingController();

  late ICategoryRepo categoryRepo;

  CategoryListController(){
    categoryRepo = Get.put(CategoryRepoImpl());
  }

  @override
  void onInit() {
    super.onInit();
  getCategory();
  }

  getCategory() async {
    try{

      final response = await categoryRepo.getCategoryAPI();
      print("dadasdsd ${response.isSuccess}");
      if(response.isSuccess){

      }else{
        showWarningSnackBar(message: "Invalid Credential");
      }

    }catch(e){}
  }


    addCategory() async {
    try{
      final Map<String, dynamic> loginMap = {
        ApiConstant.category : categoryController.text,
      };
      final response = await categoryRepo.addCategoryAPI(loginMap);
      print("dadasdsd ${response.isSuccess}");
      if(response.isSuccess){

      }else{
        showWarningSnackBar(message: "Invalid Credential");
      }

    }catch(e){}
  }


}
