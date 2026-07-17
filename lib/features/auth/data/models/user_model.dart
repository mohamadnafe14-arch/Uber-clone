import 'package:uber_clone/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.email,
    required super.name,
    required super.phone,
    required super.uid,
    required super.blockStatus,
  });
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'phone': phone,
      'uid': uid,
      'blockStatus': blockStatus,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      uid: map['uid'] ?? '',
      blockStatus: map['blockStatus'] ?? "no",
    );
  }
}
