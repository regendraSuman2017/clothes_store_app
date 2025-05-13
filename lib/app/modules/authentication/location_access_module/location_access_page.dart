import 'package:clothers_store_app/app/core_widget/button_widget.dart';
import 'package:clothers_store_app/app/modules/authentication/location_access_module/location_access_controller.dart';
import 'package:clothers_store_app/app/theme/app_colors.dart';
import 'package:clothers_store_app/app/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocationAccessPage extends GetView<LocationAccessController> {
  const LocationAccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const horizontalPadding = 24.0;
    const iconSize = 48.0;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),

              // 📍 Location icon
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.location_on, color: Colors.brown, size: iconSize),
              ),

              const SizedBox(height: 32),

              // 📝 Title
              Text(
                'What is Your Location?',
                style: AppTextStyle.extraHeading3B(),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 12),

              // 💬 Subtitle
              Text(
                'We need to know your location in order to suggest nearby services.',
                style: AppTextStyle.bodyText5SB(color: Colors.black54),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 32),

              // ✅ Allow location access button
              RoundedButton(
                text: 'Allow Location Access',
                onPressed: controller.requestLocationPermission,
              ),

              const SizedBox(height: 16),

              // 🗺️ Enter location manually
              GestureDetector(
                onTap: () => Get.toNamed('/manual-location'),
                child: Text(
                  'Enter Location Manually',
                  style: AppTextStyle.bodyText5B(color: primaryColor),
                ),
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
