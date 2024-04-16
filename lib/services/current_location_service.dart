import 'package:geolocator/geolocator.dart';

class LocationService {
  static Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      bool serviceEnabled = await Geolocator.openLocationSettings();
      if (!serviceEnabled) {
        throw Exception('Location services are disabled.');
      }
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      throw Exception(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
  }

  static Stream<Position?> getPositionStream() {
    return Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.bestForNavigation,
        distanceFilter: 5,
      ),
    );
  }

  static Future<Position> getMyCurrentLocation() async {
    try {
      Position currentPosition = await LocationService.determinePosition();
      return currentPosition;
    } catch (e) {
      print('Error obteniendo la ubicación: $e');
      rethrow;
    }
  }

  static Future<LocationPermission> checkLocationPermission() async {
    return await Geolocator.checkPermission();
  }

  static Future<void> requestLocationPermission() async {
    await Geolocator.requestPermission();
  }
}
