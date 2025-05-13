import 'package:clothers_store_app/app/modules/authentication/login_module/data/model/login_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

setPrefsLoginValue(LoginModel loginResponse) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', true);
    prefs.setString('name', loginResponse.data.name);
    prefs.setString('email', loginResponse.data.email);
    prefs.setString('token', loginResponse.data.token);
    prefs.setString('id', loginResponse.data.id.toString());
    prefs.setString('userRole', loginResponse.data.userRole.toString());
}

RxInt initialIndex = 0.obs;