import 'package:clothers_store_app/app/modules/home_module/data/categories_icon.dart';
import 'package:clothers_store_app/app/modules/home_module/data/model/category_model.dart';
import 'package:clothers_store_app/app/modules/home_module/data/model/product_model.dart';
import 'package:clothers_store_app/app/modules/home_module/widget/product_card.dart';
import 'package:clothers_store_app/app/modules/home_module/widget/promotional_banner.dart';
import 'package:clothers_store_app/app/theme/app_colors.dart';
import 'package:clothers_store_app/app/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clothers_store_app/app/modules/home_module/pages/home_controller.dart';


class HomePage extends GetView<HomeController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Location + Bell
               Obx(()=> Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined),
                        SizedBox(width: 8),
                        Text(controller.currentLocation.value,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Icon(Icons.keyboard_arrow_down),
                      ],
                    ),
                    Icon(Icons.notifications_outlined),
                  ],
                ),
          ),
                const SizedBox(height: 8),

                // Search Bar
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.tune),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none),
                  ),
                ),
                const SizedBox(height: 8),

                // Banner
                PromoBanner(),
                const SizedBox(height: 8),

                // Category
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    Text('Category', style: AppTextStyle.extraHeading1B(),),
                    Text('See All', style: AppTextStyle.bodyText5B(color: primaryColor),),
                  ],
                ),
                const SizedBox(height: 12),

                // Category Icons
            SizedBox(
              height: 80,
              child: FutureBuilder<List<CategoryModel>>(
                future: controller.getAllCategory(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (snapshot.hasData) {
                    final productModel = snapshot.data!;
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: productModel.length,
                      itemBuilder: (context, index) {
                        final product = productModel[index];
                        return CategoryIcon( label: product.name, icon: product.image, );
                      },
                    );
                  } else {
                    return Center(child: Text('No data found.'));
                  }
                },
              ),
            ),

                const SizedBox(height: 10),

                // Flash Sale Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text('Flash Sale', style: AppTextStyle.extraHeading1B(),),

                    Obx(()=>Row(
                      children: [
                        Text('Closing in :', style: AppTextStyle.bodyText4M(),),
                        SizedBox(width: 8),
                        timerBox(controller.hours.value.toString()),
                        timerBox(controller.minutes.value.toString()),
                        timerBox(controller.seconds.value.toString()),
                      ],
                    )
                    )
                  ],
                ),
                const SizedBox(height: 16),
                // Products Grid
                SizedBox(
                  height:Get.height*0.3,
                  child: FutureBuilder<List<ProductModel>>(
                    future: controller.getProducts(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (snapshot.hasData) {
                        final productModel = snapshot.data!;
                        return GridView.builder(
                          shrinkWrap: true,
                          itemCount: productModel.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.9,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                          ),
                          itemBuilder: (context, index) {
                            return ProductCard(product: productModel[index]);
                          },
                        );
                      } else {
                        return Center(child: Text('No data found.'));
                      }
                    },
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget timerBox(String value) {
  return Container(
  margin: const EdgeInsets.only(left: 4),
  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
  decoration: BoxDecoration(color: Colors.brown, borderRadius: BorderRadius.circular(6)),
  child: Text(value, style: AppTextStyle.bodyText2M(color: Colors.white)),
  );
  }
}
