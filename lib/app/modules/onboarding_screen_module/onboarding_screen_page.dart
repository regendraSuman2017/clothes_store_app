import 'package:clothers_store_app/app/routes/app_routes.dart';
import 'package:clothers_store_app/app/theme/app_colors.dart';
import 'package:clothers_store_app/app/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clothers_store_app/app/modules/onboarding_screen_module/onboarding_screen_controller.dart';


class OnboardingScreenPage extends GetView<OnboardingScreenController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(()=>Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child:Column(
            children: [
              Row(
              mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: (){
                    Get.toNamed(Routes.loginPage);

                  }, child: Text("SKIP",style: AppTextStyle.bodyText4B(color: primaryColor),)),
                ],
              ),
              SizedBox(
                height: Get.height*0.8,
                width: Get.width,
                child: PageView.builder(
                    controller: controller.pageController,
                    itemCount: controller.pages.length,
                    onPageChanged: (int page) {
                        controller.activePage.value = page;
                    },
                    itemBuilder: (BuildContext context, int index){
                      return Center(child: controller.pages[index],);
                    }
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipOval(
                    child: Material(
                      color: primaryColor, // Button color
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () { controller.pageController.previousPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );},
                          child: Icon(Icons.arrow_back,color: Colors.white,),),
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 1.75,
                    right: 0,
                    left: 0,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _buildIndicator()
                    ),
                  ),
                  // 🔽 Right arrow positioned on middle-right
                  ClipOval(
                    child: Material(
                      color: primaryColor, // Button color
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            controller.pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );

                            },
                          child: Icon(Icons.arrow_forward,color: Colors.white,),),
                      ),
                      ),
                    ),
      
                ],
              )
            ],
          ))
        ),
      
      ),
    );
  }
  //Indicator Builder
  List<Widget> _buildIndicator() {
    final indicators =  <Widget>[];

    for (var i = 0; i < controller.pages.length; i++) {

      if (controller.activePage.value == i) {
        indicators.add(_indicatorsTrue());
      } else {
        indicators.add(_indicatorsFalse());
      }
    }
    return  indicators;
  }
  // Changes colors based on screen
  Widget _indicatorsTrue() {
    if (controller.activePage.value == 0) {
    } else if(controller.activePage.value ==  1) {
    } else {
    }

    //Active Indicator
    return AnimatedContainer(
      duration: const Duration(microseconds: 300),
      height: 8,
      width: 8,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: primaryColor,
      ),
    );
  }

//Inactive Indicator
  Widget _indicatorsFalse() {
    return AnimatedContainer(
      duration: const Duration(microseconds: 300),
      height: 8,
      width: 8,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.grey.shade200,
      ),
    );
  }
}
