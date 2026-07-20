import 'package:geolocator/geolocator.dart';
import 'package:uber_clone/core/exceptions/app_exeption.dart';
import 'package:uber_clone/features/home/data/models/user_location_model.dart';

abstract class RemoteLocationDataSource {
  Future<Stream<UserLocationModel>> getCurrentLocation();
}

class RemoteLocationDataSourceImpl implements RemoteLocationDataSource {
  @override
  Future<Stream<UserLocationModel>> getCurrentLocation() async {
    await isLocationServiceEnabled();
    return Geolocator.getPositionStream().map(
      (position) => UserLocationModel(
        latitude: position.latitude,
        longitude: position.longitude,
      ),
    );
  }

  Future<bool> isLocationServiceEnabled() async {
    if (!await Geolocator.isLocationServiceEnabled()) {
      throw const AppException("Location services are disabled.");
    }

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied) {
      throw const AppException("Location permission denied.");
    }

    if (permission == LocationPermission.deniedForever) {
      throw const AppException("Location permission permanently denied.");
    }

    return true;
  }
}
