import 'package:clothers_store_app/app/core_widget/common_image.dart';
import 'package:clothers_store_app/app/theme/app_colors.dart';
import 'package:clothers_store_app/app/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clothers_store_app/app/modules/product_detail_module/product_detail_controller.dart';

class ProductDetailPage extends GetView<ProductDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(()=>controller.loading.value==true? Center(child: CircularProgressIndicator(),) :  Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell( onTap:(){ Get.back();}, child: const Icon(Icons.arrow_back_ios)),
                  const Text(
                    "Product Details",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const Icon(Icons.favorite_border),
                ],
              ),
            ),

            // Main Image
            SizedBox(
              height: 250, // adjust as needed
              child: Stack(
                children: [
                  AppImage(
                    image: controller.productDetailModel!.images[0],
                    height: 220,
                    width: Get.width,
                    fit: BoxFit.cover,
                  ),

                  if (controller.productDetailModel!.images.isNotEmpty)
                    Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: SizedBox(
                        height: 70,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          itemCount: controller.productDetailModel!.images.length,
                          itemBuilder: (_, i) => Container(
                            decoration: BoxDecoration(
                              color: primaryUltraLight,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            margin: const EdgeInsets.symmetric(horizontal: 2),
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: AppImage(
                                  image: controller.productDetailModel!.images[i],
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 10),



            // Product Info
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Female’s Style",
                      style: TextStyle(color: Colors.grey)),
                  const SizedBox(height: 4),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(controller.productDetailModel!.title,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 20),
                          Text("4.5"),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Product Details",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod...",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const Text(
                    "Read more",
                    style: TextStyle(
                        color: Colors.brown, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 12),
                  // Size Options
                  const Text("Select Size",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: ["S", "M", "L", "XL", "XXL", "XXXL"].map((size) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: ChoiceChip(
                          label: Text(size),
                          selected: size == "S",
                        ),
                      )).toList(),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text("Select Color : Brown",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),

                  Row(
                    children: const [
                      ColorDot(color: Color(0xFFD2B89E)),
                      ColorDot(color: Color(0xFFC69C6D)),
                      ColorDot(color: Color(0xFF8A5E3C)),
                      ColorDot(color: Color(0xFFA47148)),
                      ColorDot(color: Colors.black),
                    ],
                  ),
                ],
              ),
            ),

            const Spacer(),

            // Add to Cart & Price
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text("\$${controller.productDetailModel!.price.toString()}",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF6C4F3D),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    onPressed: () {
                      controller.loadCartItems();
                    },
                    icon: const Icon(Icons.shopping_cart, color: Colors.white,),
                    label:  Text("Add to Cart",style: AppTextStyle.bodyText5B(color: Colors.white),),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      )
    );
  }
}

class ColorDot extends StatelessWidget {
  final Color color;

  const ColorDot({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade300),
      ),
    );
  }
}
