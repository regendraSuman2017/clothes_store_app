import 'package:clothers_store_app/app/core_widget/custome_snackBar.dart';
import 'package:clothers_store_app/app/data/services/api_constant.dart';
import 'package:clothers_store_app/app/modules/authentication/login_module/data/repositories/login_repo.dart';
import 'package:clothers_store_app/app/modules/authentication/login_module/data/repositories/login_repo.i.dart';
import 'package:clothers_store_app/app/modules/authentication/sign_up_module/data/repositories/sign_up_repo.dart';
import 'package:clothers_store_app/app/modules/authentication/sign_up_module/data/repositories/sign_up_repo.i.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  ISignUpRepo? signUpRepo;
  ILoginRepo? loginRepo;


  TextEditingController storeNameController  = TextEditingController();
  TextEditingController nameController  = TextEditingController();
  TextEditingController emailController  = TextEditingController();
  TextEditingController passwordController  = TextEditingController();


  SignUpController() {
    signUpRepo = Get.put(SignUpRepoImpl());
    loginRepo = Get.put(LoginRepoImpl());
  }
  RxBool agree = false.obs;


  signUpApi()async{
    try{
     final  Map<String,dynamic> signPayload = {
        ApiConstant.storeName:storeNameController.text,
        ApiConstant.name:nameController.text,
        ApiConstant.emailId:emailController.text,
        ApiConstant.password:passwordController.text,
      };
      final response = await signUpRepo?.signUpAPI(signPayload);

      if(response!.isSuccess){
      }else{
        showWarningSnackBar(message: response.errorMessage);
      }

    }catch(e){}
  }

}
