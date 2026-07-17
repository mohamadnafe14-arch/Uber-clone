import 'package:fpdart/fpdart.dart';
import 'package:uber_clone/core/errors/failure.dart';
import 'package:uber_clone/core/utils/generic_use_case.dart';
import 'package:uber_clone/features/auth/domain/entities/user_entity.dart';
import 'package:uber_clone/features/auth/domain/repos/auth_repo.dart';

class SignInUseCase extends GenericUseCase<UserEntity, SignInUseCaseParams> {
  final AuthRepo authRepo;
  SignInUseCase(this.authRepo);
  @override
  Future<Either<Failure, UserEntity>> call(SignInUseCaseParams params) {
    return authRepo.signIn(email: params.email, password: params.password);
  }
}

class SignInUseCaseParams {
  final String email;
  final String password;
  const SignInUseCaseParams({required this.email, required this.password});
}
