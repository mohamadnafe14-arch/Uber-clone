import 'package:fpdart/fpdart.dart';
import 'package:uber_clone/core/errors/failure.dart';
import 'package:uber_clone/core/utils/generic_use_case.dart';
import 'package:uber_clone/features/auth/domain/entities/user_entity.dart';
import 'package:uber_clone/features/auth/domain/repos/auth_repo.dart';

class SignUpUseCase extends GenericUseCase<UserEntity, SignUpUseCaseParams> {
  final AuthRepo authRepo;
  SignUpUseCase(this.authRepo);
  @override
  Future<Either<Failure, UserEntity>> call(SignUpUseCaseParams params) {
    return authRepo.signUp(
      email: params.email,
      password: params.password,
      name: params.name,
      phone: params.phone,
    );
  }
}

class SignUpUseCaseParams {
  final String email;
  final String password;
  final String name;
  final String phone;

  const SignUpUseCaseParams({
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
  });
}
