import 'dart:convert';
import 'dart:developer';

import 'package:clothers_store_app/app/core_widget/custome_snackBar.dart';
import 'package:clothers_store_app/app/data/services/api_constant.dart';
import 'package:clothers_store_app/app/modules/admin/category_list_module/category_list_controller.dart';
import 'package:clothers_store_app/app/modules/admin/category_list_module/data/model/category_model.dart';
import 'package:clothers_store_app/app/modules/admin/category_list_module/data/repositories/category_repo.dart';
import 'package:clothers_store_app/app/modules/admin/category_list_module/data/repositories/category_repo.i.dart';
import 'package:clothers_store_app/app/modules/admin/product_module/data/model/product_model.dart';
import 'package:clothers_store_app/app/modules/admin/product_module/data/repositories/product_repo.dart';
import 'package:clothers_store_app/app/modules/admin/product_module/data/repositories/product_repo.i.dart';
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
TextEditingController priceController = TextEditingController();
TextEditingController descController = TextEditingController();
TextEditingController stockController = TextEditingController();
  late ICategoryRepo categoryRepo;
  late IProductRepo productRepo;
  late CategoryModel categoryModel;
  late ProductModel productModel;

  RxInt categoryId = 0.obs;

  RxBool loader = false.obs;
  RxBool showListCategory = false.obs;
  @override
  void onInit() {
    super.onInit();
    categoryRepo = Get.put(CategoryRepoImpl());
    productRepo = Get.put(ProductRepoImpl());
    categoryModel   = CategoryModel();
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

  Future<List<Datums>> getProduct() async {
    try {
      loader.value = true;
      final response = await productRepo.getProductAPI();
      log('📥 API Response - Success: ${response.isSuccess}, Status: ${response.statusCode}');
      log('📦 Raw Response Data: ${response.data}');

      if (response.isSuccess == true && response.data != null) {
        Map<String, dynamic> jsonMap;
        try {
          jsonMap = jsonDecode(response.data.toString()) as Map<String, dynamic>;
          log('🔍 Parsed JSON Map: $jsonMap');
        } catch (e) {
          log('❌ JSON decode error: $e');
          loader.value = false;
          return [];
        }

        // Parse the ProductModel
        final productModel = ProductModel.fromJson(jsonMap);
        log('📊 Product Model - Success: ${productModel.success}, Message: ${productModel.message}');

        if (productModel.data == null) {
          log('⚠️ Product data is null');
          loader.value = false;
          return [];
        }

        log('✅ Found ${productModel.data!.length} products');
        loader.value = false;
        return productModel.data;
      } else {
        log('❌ API Error: ${response.errorMessage ?? 'Unknown error'}');
        loader.value = false;
        return [];
      }
    } catch (e) {
      log('💥 API Call Error: $e');
      loader.value = false;
      return [];
    }
  }

XFile? imageFile;
final ImagePicker _picker = ImagePicker();
  addProduct() async {
    try {
      final Map<String, dynamic> loginMap = {
        ApiConstant.id : categoryId.value,
        ApiConstant.name : productController.text,
        ApiConstant.price : priceController.text,
        ApiConstant.description : descController.text,
        ApiConstant.stock : stockController.text,
      };

      print("dakdhjk ${loginMap}");
      final response = await productRepo.addProductAPI(loginMap, imageFile!.name, imageFile!.path);

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
