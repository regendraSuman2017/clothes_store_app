import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSuccessSnackBar() {
  Get.snackbar(
    'Success',
    'Operation Successful!',
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.green,
    colorText: Colors.white,
    duration: Duration(seconds: 2),
    margin: EdgeInsets.all(10),
    borderRadius: 10,
  );
}

// Warning Snackbar using GetX
void showWarningSnackBar({String? message}) {
  Get.snackbar(
    'Warning',
    message.toString(),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.yellow,
    colorText: Colors.black,
    duration: Duration(seconds: 2),
    margin: EdgeInsets.all(10),
    borderRadius: 10,
  );
}

// Alert Snackbar using GetX
void showAlertSnackBar() {
  Get.snackbar(
    'Error',
    'Error: Something went wrong!',
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.red,
    colorText: Colors.white,
    duration: Duration(seconds: 2),
    margin: EdgeInsets.all(10),
    borderRadius: 10,
  );
}