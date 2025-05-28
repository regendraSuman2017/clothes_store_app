import 'package:clothers_store_app/app/core_widget/button_widget.dart';
import 'package:clothers_store_app/app/core_widget/custome_text_form_fiels.dart';
import 'package:clothers_store_app/app/routes/app_routes.dart';
import 'package:clothers_store_app/app/theme/app_colors.dart';
import 'package:clothers_store_app/app/theme/app_text_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clothers_store_app/app/modules/authentication/login_module/presentation/pages/login_controller.dart';


class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Center(
                  child: Text(
                    'Sign In',
                    style: AppTextStyle.extraHeading5B()
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: Text(
                    "Hi! Welcome back, you’ve been missed",
                    style: AppTextStyle.bodyText5SB(),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 40),
                Text("Email", style: AppTextStyle.bodyText5SB(),),
                SizedBox(height: 8),
                CustomTextField(
                  hintText: 'Enter Email ID',
                  controller: controller.emailController,

                ),
                SizedBox(height: 20),
                Text("Password", style: AppTextStyle.bodyText5SB(),),
                SizedBox(height: 8),
               Obx(()=> CustomTextField(
                  hintText: '********',
                  obscureText: controller.obscureIcon.value,
                  controller: controller.passwordController,
                  suffixIcon: InkWell( onTap: (){controller.obscureIcon.toggle();},
                      child: Icon(controller.obscureIcon.value ?Icons.visibility_off : Icons.visibility)),
                ),
               ),
                SizedBox(height: 6),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password?",
                      style: AppTextStyle.bodyText6B(color: primaryColor),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                RoundedButton(text: 'Sign In', onPressed: () async {
                  // await LocalNotificationService.initialize();
                  // await LocalNotificationService.scheduleNotification();
                  controller.loginAPI();
                }),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(child: Divider()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text("Or sign in with"),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _socialIcon('assets/auth_img/mac-os.png'),   // <-- Replace with actual icon paths
                    _socialIcon('assets/auth_img/img.png'),
                    _socialIcon('assets/auth_img/facebook.png'),
                  ],
                ),
                SizedBox(height: 30),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Don’t have an account? ",
                      style: AppTextStyle.bodyText4B(color: blackDarker),
                      children: [
                        TextSpan(
                          text: "Sign Up",
                          style: AppTextStyle.bodyText4B(color: primaryColor),
                          recognizer: TapGestureRecognizer()..onTap = () => Get.toNamed(Routes.signUpPage),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _socialIcon(String assetPath) {
    return Container(
      height: 50,
      width: 50,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        shape: BoxShape.circle,
      ),
      child: Image.asset(assetPath, fit: BoxFit.contain),
    );
  }
}
