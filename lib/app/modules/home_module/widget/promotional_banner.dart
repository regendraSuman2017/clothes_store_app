import 'package:clothers_store_app/app/theme/app_colors.dart';
import 'package:clothers_store_app/app/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PromoBanner extends StatelessWidget {
  const PromoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,

      decoration: BoxDecoration(
        color: const Color(0xFFF7F1EB), // Light background
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          // Text Section
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    'New Collection',
                    style:AppTextStyle.heading2B()
                  ),
                   Text(
                    'Discount 50% for\nthe first transaction',
                      style:AppTextStyle.bodyText3M(color: Colors.grey)
                  ),
                  const SizedBox(height: 8),

                  Container(
                      height: 30,
                      width: Get.width*0.3,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(4)
                      ),
                      child: Center(child: Text('Shop Now', style: AppTextStyle.bodyText4M(color: Colors.white),)))
                ],
              ),
            ),
          ),

          // Image Section
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              child: Image.asset(
                'assets/home_page/banner_girls.png', // <- Replace with your actual asset path
                fit: BoxFit.cover,
                height: double.infinity,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
