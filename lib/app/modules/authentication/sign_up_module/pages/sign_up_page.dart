import 'package:clothers_store_app/app/core_widget/button_widget.dart';
import 'package:clothers_store_app/app/core_widget/custome_text_form_fiels.dart';
import 'package:clothers_store_app/app/routes/app_routes.dart';
import 'package:clothers_store_app/app/theme/app_colors.dart';
import 'package:clothers_store_app/app/theme/app_text_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clothers_store_app/app/modules/authentication/sign_up_module/pages/sign_up_controller.dart';

class SignUpPage extends GetView<SignUpController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Center(
                child: Text('Create Account', style: AppTextStyle.extraHeading5B()),
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  "Fill your information below or register with your social account.",
                  style: AppTextStyle.bodyText5SB(),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 25),

              _buildLabel("Store Name"),
              const SizedBox(height: 8),
              CustomTextField(hintText: 'Enter store name',controller: controller.storeNameController,),
              const SizedBox(height: 10),

              _buildLabel("Name"),
              const SizedBox(height: 8),
              CustomTextField(hintText: 'Enter name',controller: controller.nameController,),
              const SizedBox(height: 10),

              _buildLabel("Email"),
              const SizedBox(height: 8),
              CustomTextField(hintText: 'example@gmail.com',controller: controller.emailController),
              const SizedBox(height: 10),

              _buildLabel("Password"),
              const SizedBox(height: 8),
              CustomTextField(
                hintText: '********',
                obscureText: true
                  ,controller: controller.passwordController,
                suffixIcon: Icon(Icons.visibility_off),
              ),
              const SizedBox(height: 8),

              _buildTermsCheckbox(),

              const SizedBox(height: 10),
              RoundedButton(text: 'Sign Up', onPressed: () {
                controller.signUpApi();
              }),

              const SizedBox(height: 15),
              _buildDivider(),

              const SizedBox(height: 10),
              _buildSocialIcons(),

              const SizedBox(height: 20),
              _buildAlreadyHaveAccount(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(text, style: AppTextStyle.bodyText5SB());
  }

  Widget _buildTermsCheckbox() {
    return Row(
      children: [
        Obx(() => Checkbox(
          value: controller.agree.value,
          onChanged: (_) => controller.agree.toggle(),
          focusColor: primaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        )),
        Expanded(
          child: Wrap(
            children: [
              Text("Agree with ", style: AppTextStyle.bodyText4B(color: blackDarker)),
              GestureDetector(
                onTap: () {}, // Navigate to Terms screen
                child: Text(
                  "Terms & Condition",
                  style: AppTextStyle.bodyText4B(color: primaryColor),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Row(
      children: [
        const Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text("Or sign in with", style: AppTextStyle.bodyText4SB()),
        ),
        const Expanded(child: Divider()),
      ],
    );
  }

  Widget _buildSocialIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _socialIcon('assets/auth_img/mac-os.png'),
        _socialIcon('assets/auth_img/img.png'),
        _socialIcon('assets/auth_img/facebook.png'),
      ],
    );
  }

  Widget _socialIcon(String assetPath) {
    return Container(
      height: 50,
      width: 50,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        shape: BoxShape.circle,
      ),
      child: Image.asset(assetPath, fit: BoxFit.contain),
    );
  }

  Widget _buildAlreadyHaveAccount() {
    return Center(
      child: RichText(
        text: TextSpan(
          text: "Already have an account? ",
          style: AppTextStyle.bodyText4B(),
          children: [
            TextSpan(
              text: "Sign In",
              style: AppTextStyle.bodyText4B(color: primaryColor),
              recognizer: TapGestureRecognizer()..onTap = () => Get.toNamed(Routes.loginPage),

              // Add gesture recognizer if needed
            ),
          ],
        ),
      ),
    );
  }
}
