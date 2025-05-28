import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:clothers_store_app/app/core_widget/button_widget.dart';
import 'package:clothers_store_app/app/core_widget/custome_text_form_fiels.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clothers_store_app/app/modules/admin/category_list_module/category_list_controller.dart';

class CategoryListPage extends GetView<CategoryListController> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('category_list Page')),

      body: Obx(()=> controller.loader.value? Center(child: CircularProgressIndicator(),):SizedBox(
        height: Get.height,
        child: ListView.builder( itemCount: controller.categoryModel.data!.length, itemBuilder: (BuildContext context, int index){
          return ListTile(
            leading: Icon(Icons.account_circle_outlined),
            title: Text("${controller.categoryModel.data![index].categoryName}"),
          );
        }),
      )),

      floatingActionButton: FloatingActionButton(onPressed: (){
        showModalBottomSheet(context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            builder: (context){
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
            height: Get.height*0.35,
            width: Get.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Add Category",style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),),
                SizedBox(height: 8,),
                imageProfile(context),
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


  Widget imageProfile(context) {
    return Center(
      child: Stack(children: <Widget>[
        CircleAvatar(
          radius: 40.0,
          backgroundImage: controller.imageFile == null
              ? AssetImage("")
              : FileImage(File(controller.imageFile!.path)),
        ),
        Positioned(
          bottom: 8.0,
          right: 10.0,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: ((builder) => bottomSheet(context)),
              );
            },
            child: Icon(
              Icons.camera_alt,
              color: Colors.teal,
              size: 15.0,
            ),
          ),
        ),
      ]),
    );
  }


  Widget bottomSheet(context) {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            IconButton(
              icon: Column(
                children: [
                  Icon(Icons.camera),
                  Text("Camera"),
                ],
              ),
              onPressed: () {
                controller.takePhoto(ImageSource.camera);
              },

            ),

            IconButton(
              icon: Column(
                children: [
                  Icon(Icons.image),
                  Text("Gallery"),
                ],
              ),
              onPressed: () {
                controller.takePhoto(ImageSource.gallery);
              },

            ),

          ])
        ],
      ),
    );
  }


}
