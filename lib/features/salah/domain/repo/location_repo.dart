import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class LocationRepo {
  Future<int> handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    bool isConnected = await InternetConnectionChecker().hasConnection;
    if (!isConnected) {
      return 1;
    }

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return 2;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      return 3;
    }
    if (permission == LocationPermission.deniedForever) {
      return 3;
    }

    return 0;
  }

  Future<Position> getCurrentLocation() async {
    return await Geolocator.getCurrentPosition();
  }

  Future<List<Placemark>> getAddress(
    double latitude,
    double longitude,
  ) async {
    return await placemarkFromCoordinates(
      latitude,
      longitude,
      localeIdentifier: 'ar_SA',
    );
  }
}
