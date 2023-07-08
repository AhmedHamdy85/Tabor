import 'package:geolocator/geolocator.dart';

class HelperClass {
  static Future<Position> determinePosition() async {
    bool enabledService = await Geolocator.isLocationServiceEnabled();
    if (!enabledService) {
      await Geolocator.requestPermission();
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
