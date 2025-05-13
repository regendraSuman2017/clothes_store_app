import 'package:clothers_store_app/app/data/services/cart_item.dart';
import 'package:clothers_store_app/app/modules/cart_list_module/cart_item_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clothers_store_app/app/modules/cart_list_module/cart_list_controller.dart';

class CartListPage extends GetView<CartListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('cart_list Page')),
      body:   SizedBox(
        height:Get.height*0.9,
        child: FutureBuilder<List<CartItem>>(
          future: controller.getProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              final productModel = snapshot.data!;
              return ListView.builder(
                shrinkWrap: true,
                itemCount: productModel.length,
                itemBuilder: (context, index) {
                  return CartItemCard(product: productModel[index]);
                },
              );
            } else {
              return Center(child: Text('No data found.'));
            }
          },
        ),
      ),
    );
  }
}
