import 'package:fpdart/fpdart.dart';
import 'package:uber_clone/core/errors/failure.dart';

abstract class GenericUseCase<Success, Params> {
  Future<Either<Failure, Success>> call(Params params);
}
