import 'package:clothers_store_app/app/core_widget/common_image.dart';
import 'package:clothers_store_app/app/data/services/cart_item.dart';
import 'package:clothers_store_app/app/theme/app_colors.dart';
import 'package:clothers_store_app/app/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartItemCard extends StatelessWidget {
  final CartItem product;

  const CartItemCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(product.id.toString()),
      background: Container(color: Colors.red),
      secondaryBackground: Container(color: Colors.red, child: Icon(Icons.delete,size: 10, color: Colors.white,),),
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
        }
      },
      resizeDuration: null,
      child: Container(
        margin: EdgeInsets.only(left: 8,bottom: 8,right: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           Row(
             children: [
               AppImage(image: product.imageUrl.toString(),height: Get.height*0.1,),
               const SizedBox(width: 8),
               Column(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   SizedBox( width: Get.width*0.4,  child: Text(product.name.toString(),
                     style: AppTextStyle.bodyText4B(), maxLines: 1,)),
                   Text("Size: XXL",  style: AppTextStyle.bodyText3SB()),
                   Text("\$${product.price}",   style: AppTextStyle.bodyText3SB()),
                 ],
               ),
             ],
           ),
      
            SizedBox(
              width: 60,
      
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: primaryColor,
                    ),
                    child: Center(child: Icon(Icons.remove,color: Colors.white,size: 15,)),
                  ),
                  Text(product.quantity.toString(),style: AppTextStyle.bodyText2M(),),
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: primaryColor,
                    ),
                    child: Center(child: Icon(Icons.add,color: Colors.white,size: 15)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
