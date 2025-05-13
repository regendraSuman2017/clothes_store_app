import 'dart:convert';
import 'package:clothers_store_app/app/core_widget/custome_snackBar.dart';
import 'package:clothers_store_app/app/data/services/api_constant.dart';
import 'package:clothers_store_app/app/modules/authentication/login_module/data/model/login_model.dart';
import 'package:clothers_store_app/app/modules/authentication/login_module/data/repositories/login_repo.dart';
import 'package:clothers_store_app/app/modules/authentication/login_module/data/repositories/login_repo.i.dart';
import 'package:clothers_store_app/app/routes/app_routes.dart';
import 'package:clothers_store_app/app/utils/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{

 late  ILoginRepo loginRepo;

  LoginController(){
    loginRepo = Get.put(LoginRepoImpl());
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  loginAPI() async {
    try{
      final Map<String, dynamic> loginMap = {
        ApiConstant.emailId : emailController.text,
        ApiConstant.password: passwordController.text
      };
      final response = await loginRepo.loginAPI(loginMap);
      print("dadasdsd ${response.isSuccess}");
      if(response.isSuccess){
        print("dadasdsd ${response}");
        LoginModel result = LoginModel.fromJson(jsonDecode(response.data.toString()));

        await setPrefsLoginValue(result);

        Get.offAllNamed(Routes.dashboard);

      }else{
        showWarningSnackBar(message: "Invalid Credential");
      }

    }catch(e){}
  }
}
