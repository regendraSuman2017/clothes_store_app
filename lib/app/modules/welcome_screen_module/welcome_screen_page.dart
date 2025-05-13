import 'package:clothers_store_app/app/core_widget/button_widget.dart';
import 'package:clothers_store_app/app/routes/app_routes.dart';
import 'package:clothers_store_app/app/theme/app_colors.dart';
import 'package:clothers_store_app/app/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clothers_store_app/app/modules/welcome_screen_module/welcome_screen_controller.dart';


class WelcomeScreenPage extends GetView<WelcomeScreenController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 15),
          height: Get.height*0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      'assets/welcome_screen/welcome_screen_img_1.jpg',
                      height: 450, // <-- Set height/width to control size
                      width: 130,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 20),
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          'assets/welcome_screen/welcome_screen_img_1.jpg',
                          height: 250, // <-- Set height/width to control size
                          width: 130,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/welcome_screen/welcome_screen_img_1.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )

                    ],
                  )
                ],
              ),

              RichText(
                  text: TextSpan(
                text: 'The ',
                      style: AppTextStyle.extraHeading4B(color: blackBase),
                children:[
                  TextSpan(
                    text: 'Clothes Store App ',
                      style: AppTextStyle.extraHeading4B(color: primaryColor)
                  ),
                  TextSpan(
                    text: 'That'
                  ), TextSpan(
                    text: '\nMakes You Look Your Best'
                  ),
                ]
              )
              ),
              RoundedButton(
                onPressed: (){
                  Get.toNamed(Routes.onboardingScreen);
                },
                text:"Let's Get Start",
              ),

            RichText(

              // Controls visual overflow
              overflow: TextOverflow.clip,

              // Controls how the text should be aligned horizontally
              textAlign: TextAlign.end,

              // Control the text direction
              textDirection: TextDirection.rtl,

              // Whether the text should break at soft line breaks
              softWrap: true,

              // Maximum number of lines for the text to span
              textScaler: TextScaler.linear(1),
              maxLines: 1,
              text: TextSpan(
                text: 'Already have an account ',
                  style: AppTextStyle.bodyText6M(color: blackDarker),
                children:  <TextSpan>[
                  TextSpan(
                      text: 'Sign in',
                      style: AppTextStyle.bodyText6M(color: primaryColor,underLine: true),
                  ),
                ],
              ),
            ),

            ],
          ),
        )
      ),
    );
  }
}
