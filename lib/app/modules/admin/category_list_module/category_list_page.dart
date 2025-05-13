import 'package:clothers_store_app/app/core_widget/button_widget.dart';
import 'package:clothers_store_app/app/core_widget/custome_text_form_fiels.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clothers_store_app/app/modules/admin/category_list_module/category_list_controller.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class CategoryListPage extends GetView<CategoryListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('category_list Page')),

      floatingActionButton: FloatingActionButton(onPressed: (){
        showModalBottomSheet(context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            builder: (context){
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
            height: Get.height*0.2,
            width: Get.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Add Category",style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),),
                SizedBox(height: 8,),
                Form(child: CustomTextField(hintText: 'Category Name',controller:
                  controller.categoryController,)),
                SizedBox(height: 8,),
                RoundedButton(text: 'Save', onPressed: (){
                  controller.addCategory();
                })
              ],
            ),
          );
            });
      },),
    );
  }
}
