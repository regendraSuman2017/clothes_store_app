import 'dart:io';

import 'package:clothers_store_app/app/modules/admin/product_module/product_controller.dart';
import 'package:clothers_store_app/app/modules/admin/product_module/widget/bottom_sheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImagePathWidget extends StatelessWidget {
  const ImagePathWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return imageProfile(context, Get.find<ProductController>());
  }
}

Widget imageProfile(BuildContext context,ProductController controller) {

    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 40.0,
            backgroundImage: controller.imageFile != null
                ? FileImage(File(controller.imageFile!.path))
                : null,
          ),
          Positioned(
            bottom: 8.0,
            right: 10.0,
            child: InkWell(
              onTap: () =>
                  showModalBottomSheet(
                    context: context,
                    builder: (builder) => BottomSheetWidget(),
                  ),
              child: const Icon(
                Icons.camera_alt,
                color: Colors.teal,
                size: 15.0,
              ),
            ),
          ),
        ],
      ),
    );
}