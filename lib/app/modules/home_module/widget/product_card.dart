import 'package:clothers_store_app/app/core_widget/common_image.dart';
import 'package:clothers_store_app/app/modules/home_module/data/model/product_model.dart';
import 'package:clothers_store_app/app/routes/app_routes.dart';
import 'package:clothers_store_app/app/theme/app_colors.dart';
import 'package:clothers_store_app/app/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
       onTap: (){
         Get.toNamed(Routes.productDetails,arguments: {'product':product});
       },
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: primaryUltraLight),
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                AppImage(image: product.images! [0].toString(),height: Get.height*0.12, width: Get.width,),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Icon(Icons.favorite_border),
                )
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox( width: Get.width*0.3,  child: Text(product.title.toString(),
                  style: AppTextStyle.bodyText3SB(), maxLines: 2,)),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    Text('4'.toString(),style: AppTextStyle.bodyText3SB(),),
                  ],
                )
              ],
            ),
            Text("\$${product.price}", style: TextStyle(color: primaryColor)),
          ],
        ),
      ),
    );
  }
}
