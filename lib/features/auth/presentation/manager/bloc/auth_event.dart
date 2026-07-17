part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class SignInEvent extends AuthEvent {
  final String email;
  final String password;
  SignInEvent({required this.email, required this.password});
}

final class SignUpEvent extends AuthEvent {
  final String email;
  final String password;
  final String name;
  final String phone;
  SignUpEvent({
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
  });
}
