import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uber_clone/features/auth/domain/entities/user_entity.dart';
import 'package:uber_clone/features/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:uber_clone/features/auth/domain/use_cases/sign_up_use_case.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInUseCase signInUseCase;
  final SignUpUseCase signUpUseCase;
  AuthBloc({required this.signInUseCase, required this.signUpUseCase})
    : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      emit(AuthLoading());
      if (event is SignInEvent) {
        final result = await signInUseCase.call(
          SignInUseCaseParams(email: event.email, password: event.password),
        );
        result.fold(
          (l) => emit(AuthError(l.message)),
          (r) => emit(AuthSuccess(r)),
        );
      }
      if (event is SignUpEvent) {
        final result = await signUpUseCase.call(
          SignUpUseCaseParams(
            email: event.email,
            password: event.password,
            name: event.name,
            phone: event.phone,
          ),
        );
        result.fold(
          (l) => emit(AuthError(l.message)),
          (r) => emit(AuthSuccess(r)),
        );
      }
    });
  }
}
