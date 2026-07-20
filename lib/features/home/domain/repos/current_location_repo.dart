import 'package:fpdart/fpdart.dart';
import 'package:uber_clone/core/errors/failure.dart';
import 'package:uber_clone/features/home/domain/entities/user_location_entity.dart';

abstract class CurrentLocationRepo {
  Future<Either<Failure, Stream<UserLocationEntity>>> getCurrentLocation();
}
