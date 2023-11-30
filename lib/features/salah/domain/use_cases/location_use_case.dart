import 'package:dartz/dartz.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:quran_app/core/cache/save_data.dart';
import 'package:quran_app/core/errors/permission_handler.dart';
import 'package:quran_app/features/salah/domain/repo/location_repo.dart';

abstract class UseCase {
  Future<Either<HandlePermission, Position>> locate();
}

class LocationUseCase extends UseCase {
  final LocationRepo locationRepo;

  LocationUseCase(this.locationRepo);
  @override
  Future<Either<HandlePermission, Position>> locate() async {
    int num = await locationRepo.handleLocationPermission();
    savePermissionNum(num);
    if (num == 0) {
      Position currentPosition = await locationRepo.getCurrentLocation();
      List<Placemark> placemarks = await locationRepo.getAddress(
          currentPosition.latitude, currentPosition.longitude);
      String address1 = placemarks[0].subAdministrativeArea!;
      String address2 = placemarks[0].administrativeArea!;

      saveAddress("$address1 $address2");
      return right(currentPosition);
    } else {
      return left(Wanring.fromHandlePermission(num));
    }
  }
}
