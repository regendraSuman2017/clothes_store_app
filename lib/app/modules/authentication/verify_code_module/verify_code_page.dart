import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clothers_store_app/app/modules/authentication/verify_code_module/verify_code_controller.dart';

class VerifyCodePage extends GetView<VerifyCodeController> {
  final TextEditingController code1 = TextEditingController();
  final TextEditingController code2 = TextEditingController();
  final TextEditingController code3 = TextEditingController();
  final TextEditingController code4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button
              IconButton(
                icon: Icon(Icons.arrow_back_ios_new, size: 20),
                onPressed: () => Get.back(),
              ),
              const SizedBox(height: 20),

              // Title
              Center(
                child: Text("Verify Code",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 8),

              // Subtitle
              Center(
                child: Text(
                  "Please enter the code we just sent to email\nexample@email.com",
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 40),

              // OTP Fields
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _otpBox(code1),
                  _otpBox(code2),
                  _otpBox(code3),
                  _otpBox(code4),
                ],
              ),

              const SizedBox(height: 24),

              // Resend
              Center(
                child: Column(
                  children: [
                    Text("Didn't receive OTP?",
                        style: TextStyle(color: Colors.black54)),
                    TextButton(
                      onPressed: () {
                        // Resend logic
                      },
                      child: Text("Resend code",
                          style: TextStyle(
                              color: Color(0xFF6F3D2E),
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline)),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              // Verify Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Verify OTP logic
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF6F3D2E),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text("Verify", style: TextStyle(fontSize: 16)),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _otpBox(TextEditingController controller) {
    return SizedBox(
      width: 55,
      height: 55,
      child: TextField(
        controller: controller,
        maxLength: 1,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          counterText: "",
          filled: true,
          fillColor: Colors.grey[100],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
