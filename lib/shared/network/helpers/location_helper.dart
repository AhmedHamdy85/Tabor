import 'package:geolocator/geolocator.dart';
class HelperClass {
  static Future<Position> determinePosition() async
  {
    bool enabledService= Geolocator.isLocationServiceEnabled() as bool;
    if (!enabledService) {
       await Geolocator.requestPermission();
    }
     return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high
     );
  }
}