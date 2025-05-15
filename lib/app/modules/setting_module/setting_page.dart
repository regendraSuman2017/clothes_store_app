import 'package:clothers_store_app/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clothers_store_app/app/modules/setting_module/setting_controller.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class SettingPage extends GetView<SettingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('setting Page')),
      body: Container(
        child: ListView(
          children: [
            ListTile(
              title: Text('Category'),
              onTap: (){
                Get.toNamed(Routes.categoryList);
              },
            ),   ListTile(
              title: Text('Product'),
              onTap: (){
                Get.toNamed(Routes.productList);
              },
            ),
          ],
        ),
      ),
    );
  }
}
