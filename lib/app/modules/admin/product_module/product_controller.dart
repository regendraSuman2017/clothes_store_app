import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProductController extends GetxController{
TextEditingController productController = TextEditingController();

XFile? imageFile;
final ImagePicker _picker = ImagePicker();
addProduct(){}
void takePhoto(ImageSource source) async {
  try {
    final XFile? pickedFile = await _picker.pickImage(source: source);

    if (pickedFile!.path.isNotEmpty) {
      imageFile = pickedFile;
    } else {
    }
  } catch (e) {
  }
}

}
