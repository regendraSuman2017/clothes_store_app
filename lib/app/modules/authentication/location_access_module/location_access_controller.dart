import 'package:clothers_store_app/app/routes/app_routes.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationAccessController extends GetxController{

  Future<void> requestLocationPermission() async {
    final status = await Permission.location.request();

    if (status.isGranted) {
      // Get current location
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
      // If placemarks are found, print the address
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];

        SharedPreferences prefs = await SharedPreferences.getInstance();
        var currentLocation = '${place.name}, ${place.locality}, ${place.country}';
        prefs.setString("currentLocation", currentLocation);


      } else {
        print('No address found for the current location.');
      }      // Navigate or perform location-based logic
    }
    else if (status.isDenied) {
      Get.snackbar("Permission Denied", "You need to allow location access to continue.");
    }
    else if (status.isPermanentlyDenied) {
      Get.snackbar("Permission Permanently Denied", "Please enable it from settings.");
      await openAppSettings();
    }
    Get.offAllNamed(Routes.dashboard);
  }

}
