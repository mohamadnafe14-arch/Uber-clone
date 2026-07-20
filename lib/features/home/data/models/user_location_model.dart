import 'package:uber_clone/features/home/domain/entities/user_location_entity.dart';

class UserLocationModel extends UserLocationEntity {
  const UserLocationModel({required super.latitude, required super.longitude});

  factory UserLocationModel.fromJson(Map<String, dynamic> json) =>
      UserLocationModel(
        latitude: json['latitude'],
        longitude: json['longitude'],
      );

  Map<String, dynamic> toJson() => {
    'latitude': latitude,
    'longitude': longitude,
  };
}
