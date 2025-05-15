import 'dart:io';

import 'package:clothers_store_app/app/core_widget/button_widget.dart';
import 'package:clothers_store_app/app/core_widget/custome_text_form_fiels.dart';
import 'package:clothers_store_app/app/modules/admin/product_module/product_controller.dart';
import 'package:clothers_store_app/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProductPage extends GetView<ProductController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('product Page')),
      body: Container(
        child:Container(child: Text(""),),
      ),
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
                    Text("Add Product",style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    ),),
                    SizedBox(height: 8,),
                    imageProfile(context),
                   Obx(()=> Form(child: Column(
                      children: [
                        CustomTextField(hintText: 'Category Name',controller: controller.categoryController,),
                        controller.loader.value==true? Center(child: CircularProgressIndicator(),)
                            :  Container(
                          height: 200,
                          decoration: BoxDecoration(
                            color: primaryUltraLight
                          ),
 padding: EdgeInsets.all(8),
                          child: ListView.builder(itemCount: controller.categoryModel.data!.length,
                              itemBuilder: (BuildContext context, int index){
                            return Text(controller.categoryModel.data![index].categoryName);
                          }),
                        ),
                        SizedBox(height: 8,),
                        CustomTextField(hintText: 'Product Name',controller:
                        controller.productController,),
                      ],
                    )),
                   ),
                    SizedBox(height: 8,),
                    RoundedButton(text: 'Save', onPressed: (){
                      controller.addProduct();
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
