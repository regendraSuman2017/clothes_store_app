import 'package:clothers_store_app/app/modules/admin/product_module/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return buildBottomSheet(context, Get.find<ProductController>());
  }
}

Widget buildBottomSheet(BuildContext context,ProductController controller) {
  return Container(
    height: 100.0,
    width: MediaQuery.of(context).size.width,
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    child: Column(
      children: [
        const Text("Choose Profile photo", style: TextStyle(fontSize: 20.0)),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Column(
                children: [
                  Icon(Icons.camera),
                  Text("Camera"),
                ],
              ),
              onPressed: () => controller.takePhoto(ImageSource.camera),
            ),
            IconButton(
              icon: const Column(
                children: [
                  Icon(Icons.image),
                  Text("Gallery"),
                ],
              ),
              onPressed: () => controller.takePhoto(ImageSource.gallery),
            ),
          ],
        )
      ],
    ),
  );
}