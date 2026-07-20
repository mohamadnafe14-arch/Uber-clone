import 'package:fpdart/fpdart.dart';
import 'package:uber_clone/core/errors/app_failure.dart';
import 'package:uber_clone/core/errors/failure.dart';
import 'package:uber_clone/core/exceptions/app_exeption.dart';
import 'package:uber_clone/features/home/data/data_sources/remote_location_data_source.dart';
import 'package:uber_clone/features/home/data/models/user_location_model.dart';
import 'package:uber_clone/features/home/domain/repos/current_location_repo.dart';

class CurrentLocationRepoImple implements CurrentLocationRepo {
  final RemoteLocationDataSource remoteLocationDataSource;
  CurrentLocationRepoImple(this.remoteLocationDataSource);
  @override
  Future<Either<Failure, Stream<UserLocationModel>>>
  getCurrentLocation() async {
    try {
      return Right(await remoteLocationDataSource.getCurrentLocation());
    } on AppException catch (e) {
      return Left(AppFailure(e.message));
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}
