import 'package:clothers_store_app/app/modules/admin/product_module/data/model/product_model.dart';
import 'package:clothers_store_app/app/modules/admin/product_module/product_controller.dart';
import 'package:clothers_store_app/app/modules/admin/product_module/widget/add_fav_widget.dart';
import 'package:clothers_store_app/app/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductPage extends GetView<ProductController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Page')),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Products",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Datums>>(
              future: controller.getProduct(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.error_outline, color: Colors.red),
                        const SizedBox(height: 8),
                        Text('Error: \${snapshot.error}',
                            style: const TextStyle(color: Colors.red)),
                      ],
                    ),
                  );
                }
                final products = snapshot.data ?? [];
                if (products.isEmpty) {
                  return const Center(
                    child: Text('No products available',
                        style: TextStyle(color: Colors.grey)),
                  );
                }
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final category = products[index];
                    return SizedBox(
                      height: 50,
                      width: Get.width,
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 25.0,
                          backgroundImage: NetworkImage(category.image),
                          backgroundColor: Colors.transparent,
                        ),
                        title: Text(category.productName, style: AppTextStyle.heading3SB()),
                        subtitle: Text("\$${category.price}", style: AppTextStyle.bodyText4M()),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: AddProductFAB(),
    );
  }
}