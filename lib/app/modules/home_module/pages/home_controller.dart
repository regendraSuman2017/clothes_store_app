import 'dart:async';
import 'dart:convert';

import 'package:clothers_store_app/app/modules/home_module/data/model/category_model.dart';
import 'package:clothers_store_app/app/modules/home_module/data/model/product_model.dart';
import 'package:clothers_store_app/app/modules/home_module/data/repositories/home_repo.dart';
import 'package:clothers_store_app/app/modules/home_module/data/repositories/home_repo.i.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  late Timer _timer;
  RxInt totalSeconds  = 7200.obs;
  RxInt seconds = 0.obs;
  RxInt hours = 2.obs;
  RxInt minutes = 0.obs;
  late IHomeRepo homeRepo;

  HomeController() {
    homeRepo = Get.put(HomeRepoImpl());
  }
RxString currentLocation = ''.obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    // getProducts();
    SharedPreferences prefs = await SharedPreferences.getInstance();

    currentLocation.value =  prefs.getString("currentLocation")??'';

    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel(); // Stop the timer when the widget is disposed
    super.dispose();
  }

  // Start the timer and update the time every second
  // Start the timer and update the time every second
  // Start the timer and update the time every second
  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (totalSeconds > 0) {

          totalSeconds--;
          hours.value = totalSeconds.value ~/ 3600; // Calculate hours
          minutes.value = (totalSeconds.value % 3600) ~/ 60; // Calculate minutes
          seconds.value = totalSeconds.value % 60; // Calculate seconds

      } else {
        _timer.cancel(); // Stop the timer when it reaches zero
      }
    });
  }

  // Convert seconds into a string format like "mm:ss"

  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await homeRepo.getAllProduct();

      if (response.isSuccess) {
        List<dynamic> data = jsonDecode(response.data.toString());
        return data.map((item) => ProductModel.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
  Future<List<CategoryModel>> getAllCategory() async {
    try {
      final response = await homeRepo.getAllCategory();

      if (response.isSuccess) {
        List<dynamic> data = jsonDecode(response.data.toString());
        return data.map((item) => CategoryModel.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }


}
