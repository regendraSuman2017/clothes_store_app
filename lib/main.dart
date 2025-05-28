import 'package:clothers_store_app/app/core_widget/display_all_notification.dart';
import 'package:clothers_store_app/app/routes/app_routes.dart';
import 'package:clothers_store_app/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Ask permission (important for Android 13+)
  await Permission.notification.request();
  LocalNotificationService.initialize();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Color(0xFF704F38), // your primaryColor
    statusBarIconBrightness: Brightness.light, // light icons (for dark background)
    systemNavigationBarColor: primaryColor,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GetX Flutter App',
      initialRoute: Routes.splashPage,
      getPages: getPages,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
