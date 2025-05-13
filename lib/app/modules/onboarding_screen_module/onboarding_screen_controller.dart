import 'package:clothers_store_app/app/theme/app_colors.dart';
import 'package:clothers_store_app/app/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OnboardingScreenController extends GetxController{

  final PageController  pageController = PageController();

  RxInt activePage = 0.obs;

  final List<Widget> pages = [
    Container(
      height: Get.height*0.8,

      padding: EdgeInsets.only(top: 50),
      child: Column(
        children: [
          Container(
            height: Get.height*0.5,
            width: Get.width*0.9,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/onboarding_img/ob_1.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
SizedBox(height: 20,),
          RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
            text: 'Seamless ',
            style: AppTextStyle.extraHeading5B(color: primaryColor),
            children: [
              TextSpan(
                text: 'Shopping \nExperience',
                style: AppTextStyle.extraHeading5B(color: blackDarker),
              )
            ]
          ))

        ],
      ),
    ),
    Container(
      height: Get.height*0.8,
      padding: EdgeInsets.only(top: 50),
      child: Column(
        children: [
          Container(
            height: Get.height*0.5,
            width: Get.width*0.9,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/onboarding_img/ob_2.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: 20,),
          RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: 'Wishlist: Where ',
                  style: AppTextStyle.extraHeading5B(color: blackDarker),
                  children: [
                    TextSpan(
                      text: 'Fashion \nDream',
                      style: AppTextStyle.extraHeading5B(color: primaryColor),
                    ),
                    TextSpan(
                      text: 'Begin',
                      style: AppTextStyle.extraHeading5B(color: blackDarker),
                    ),
                  ]
              ))

        ],
      ),
    ),
    Container(
      height: Get.height*0.8,

      padding: EdgeInsets.only(top: 50),
      child: Column(
        children: [
          Container(
            height: Get.height*0.5,
            width: Get.width*0.9,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/onboarding_img/ob_3.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: 20,),
          RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: 'Swift ',
                  style: AppTextStyle.extraHeading5B(color: primaryColor),
                  children: [
                    TextSpan(
                      text: 'and ',
                      style: AppTextStyle.extraHeading5B(color: blackDarker),
                    ),
                    TextSpan(
                      text: 'Reliable ',
                      style: AppTextStyle.extraHeading5B(color: primaryColor),
                    ),
                    TextSpan(
                      text: '\nDelivery ',
                      style: AppTextStyle.extraHeading5B(color: blackDarker),
                    ),
                  ]
              ))

        ],
      ),
    ),

  ];
}
