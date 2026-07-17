import 'package:firebase_auth/firebase_auth.dart';
import 'package:uber_clone/core/exceptions/app_exeption.dart';

class InvalidEmailException extends AppException {
  const InvalidEmailException() : super("The email address is not valid.");
}

class UserDisabledException extends AppException {
  const UserDisabledException() : super("This user account has been disabled.");
}

class UserNotFoundException extends AppException {
  const UserNotFoundException() : super("No user found with this email.");
}

class WrongPasswordException extends AppException {
  const WrongPasswordException() : super("The password is incorrect.");
}

class EmailAlreadyInUseException extends AppException {
  const EmailAlreadyInUseException() : super("This email is already in use.");
}

class WeakPasswordException extends AppException {
  const WeakPasswordException() : super("The password is too weak.");
}

class OperationNotAllowedException extends AppException {
  const OperationNotAllowedException()
    : super("This sign-in method is not enabled.");
}

class TooManyRequestsException extends AppException {
  const TooManyRequestsException()
    : super("Too many requests. Please try again later.");
}

class NetworkRequestFailedException extends AppException {
  const NetworkRequestFailedException()
    : super("Network error. Please check your internet connection.");
}

class InvalidCredentialException extends AppException {
  const InvalidCredentialException()
    : super("The supplied credential is invalid.");
}

class AccountExistsWithDifferentCredentialException extends AppException {
  const AccountExistsWithDifferentCredentialException()
    : super("An account already exists with a different sign-in provider.");
}

class CredentialAlreadyInUseException extends AppException {
  const CredentialAlreadyInUseException()
    : super("This credential is already associated with another account.");
}

class RequiresRecentLoginException extends AppException {
  const RequiresRecentLoginException()
    : super("Please log in again to perform this operation.");
}

class InvalidVerificationCodeException extends AppException {
  const InvalidVerificationCodeException()
    : super("The verification code is invalid.");
}

class InvalidVerificationIdException extends AppException {
  const InvalidVerificationIdException()
    : super("The verification ID is invalid.");
}

class SessionExpiredException extends AppException {
  const SessionExpiredException()
    : super("The verification session has expired.");
}

class ProviderAlreadyLinkedException extends AppException {
  const ProviderAlreadyLinkedException()
    : super("This provider is already linked to the account.");
}

class NoSuchProviderException extends AppException {
  const NoSuchProviderException()
    : super("This provider is not linked to the account.");
}

class UserMismatchException extends AppException {
  const UserMismatchException()
    : super("The supplied credentials do not correspond to the current user.");
}

class InvalidActionCodeException extends AppException {
  const InvalidActionCodeException()
    : super("The action code is invalid or has expired.");
}

class ExpiredActionCodeException extends AppException {
  const ExpiredActionCodeException() : super("The action code has expired.");
}

class MissingEmailException extends AppException {
  const MissingEmailException() : super("Email is required.");
}

class MissingPasswordException extends AppException {
  const MissingPasswordException() : super("Password is required.");
}

class UnknownAuthException extends AppException {
  const UnknownAuthException()
    : super("An unexpected authentication error occurred.");
}

class FirebaseAuthExceptionMapper {
  static AppException map(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return const InvalidEmailException();

      case 'user-disabled':
        return const UserDisabledException();

      case 'user-not-found':
        return const UserNotFoundException();

      case 'wrong-password':
        return const WrongPasswordException();

      case 'email-already-in-use':
        return const EmailAlreadyInUseException();

      case 'weak-password':
        return const WeakPasswordException();

      case 'operation-not-allowed':
        return const OperationNotAllowedException();

      case 'too-many-requests':
        return const TooManyRequestsException();

      case 'network-request-failed':
        return const NetworkRequestFailedException();

      case 'invalid-credential':
        return const InvalidCredentialException();

      case 'account-exists-with-different-credential':
        return const AccountExistsWithDifferentCredentialException();

      case 'credential-already-in-use':
        return const CredentialAlreadyInUseException();

      case 'requires-recent-login':
        return const RequiresRecentLoginException();

      case 'invalid-verification-code':
        return const InvalidVerificationCodeException();

      case 'invalid-verification-id':
        return const InvalidVerificationIdException();

      case 'session-expired':
        return const SessionExpiredException();

      case 'provider-already-linked':
        return const ProviderAlreadyLinkedException();

      case 'no-such-provider':
        return const NoSuchProviderException();

      case 'user-mismatch':
        return const UserMismatchException();

      case 'invalid-action-code':
        return const InvalidActionCodeException();

      case 'expired-action-code':
        return const ExpiredActionCodeException();

      case 'missing-email':
        return const MissingEmailException();

      case 'missing-password':
        return const MissingPasswordException();

      default:
        return UnknownAuthException();
    }
  }
}
