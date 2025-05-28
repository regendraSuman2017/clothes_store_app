import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:clothers_store_app/app/core_widget/button_widget.dart';
import 'package:clothers_store_app/app/core_widget/custome_text_form_fiels.dart';
import 'package:clothers_store_app/app/modules/admin/product_module/product_controller.dart';
import 'package:clothers_store_app/app/theme/app_colors.dart';
import 'image_path_widget.dart'; // Your image widget

class AddProductFAB extends StatelessWidget {
  final ProductController controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _showAddProductSheet(context),
      child: Icon(Icons.add),
    );
  }

  void _showAddProductSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.85,
              ),
              width: Get.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Add Product",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  ImagePathWidget(),
                  Obx(() => Form(
                    child: Column(
                      children: [
                        CustomTextField(
                          hintText: 'Category Name',
                          controller: controller.categoryController,
                          readOnly: true,
                          onTap: () => controller.showListCategory.toggle(),
                        ),
                        if (controller.loader.value)
                          const Center(child: CircularProgressIndicator())
                        else if (controller.showListCategory.value)
                          Container(
                            height: 100,
                            decoration: BoxDecoration(color: primaryUltraLight),
                            padding: const EdgeInsets.all(8),
                            child: ListView.builder(
                              itemCount: controller.categoryModel.data?.length ?? 0,
                              itemBuilder: (context, index) {
                                final item = controller.categoryModel.data![index];
                                return InkWell(
                                  onTap: () {
                                    controller.categoryController.text = item.categoryName;
                                    controller.categoryId.value = item.id;
                                    controller.showListCategory.value = false;
                                  },
                                  child: Text(item.categoryName),
                                );
                              },
                            ),
                          ),
                        const SizedBox(height: 8),
                        CustomTextField(
                          hintText: 'Product Name',
                          controller: controller.productController,
                        ),
                        const SizedBox(height: 8),
                        CustomTextField(
                          hintText: 'Price',
                          controller: controller.priceController,
                        ),
                        const SizedBox(height: 8),
                        CustomTextField(
                          hintText: 'Description',
                          controller: controller.descController,
                        ),
                        const SizedBox(height: 8),
                        CustomTextField(
                          hintText: 'Stock',
                          controller: controller.stockController,
                        ),
                      ],
                    ),
                  )),
                  const SizedBox(height: 8),
                  RoundedButton(
                    text: 'Save',
                    onPressed: () => controller.addProduct(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
