import 'package:fpdart/fpdart.dart';
import 'package:uber_clone/core/errors/failure.dart';
import 'package:uber_clone/core/utils/generic_use_case.dart';
import 'package:uber_clone/core/utils/no_params.dart';
import 'package:uber_clone/features/home/domain/entities/user_location_entity.dart';
import 'package:uber_clone/features/home/domain/repos/current_location_repo.dart';

class GetCurrentLocationUseCase
    extends GenericUseCase<Stream<UserLocationEntity>, NoParams> {
  final CurrentLocationRepo currentLocationRepo;
  GetCurrentLocationUseCase(this.currentLocationRepo);
  @override
  Future<Either<Failure, Stream<UserLocationEntity>>> call(NoParams params) {
    return currentLocationRepo.getCurrentLocation();
  }
}
