import 'package:fpdart/fpdart.dart';
import 'package:uber_clone/core/errors/failure.dart';
import 'package:uber_clone/core/utils/generic_use_case.dart';
import 'package:uber_clone/core/utils/no_params.dart';
import 'package:uber_clone/features/auth/domain/repos/auth_repo.dart';

class SignOutUseCase extends GenericUseCase<void, NoParams> {
  final AuthRepo authRepo;
  SignOutUseCase(this.authRepo);
  @override
  Future<Either<Failure, void>> call(NoParams params) {
    return authRepo.signOut();
  }
}
