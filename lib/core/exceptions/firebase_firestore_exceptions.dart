import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uber_clone/core/exceptions/app_exeption.dart';

class FirestoreException extends AppException {
  const FirestoreException([
    super.message = "An unexpected Firestore error occurred.",
  ]);
}

class PermissionDeniedException extends FirestoreException {
  const PermissionDeniedException()
    : super("You don't have permission to perform this operation.");
}

class DocumentNotFoundException extends FirestoreException {
  const DocumentNotFoundException()
    : super("The requested document was not found.");
}

class AlreadyExistsException extends FirestoreException {
  const AlreadyExistsException() : super("The document already exists.");
}

class OperationCancelledException extends FirestoreException {
  const OperationCancelledException() : super("The operation was cancelled.");
}

class DeadlineExceededException extends FirestoreException {
  const DeadlineExceededException()
    : super("The operation timed out. Please try again.");
}

class ServiceUnavailableException extends FirestoreException {
  const ServiceUnavailableException()
    : super("The service is currently unavailable.");
}

class NetworkRequestFailedException extends FirestoreException {
  const NetworkRequestFailedException()
    : super("Network error. Please check your internet connection.");
}

class InvalidArgumentException extends FirestoreException {
  const InvalidArgumentException() : super("Invalid data was provided.");
}

class ResourceExhaustedException extends FirestoreException {
  const ResourceExhaustedException() : super("Resource limit exceeded.");
}

class FailedPreconditionException extends FirestoreException {
  const FailedPreconditionException()
    : super(
        "Operation failed because the system is not in the required state.",
      );
}

class AbortedException extends FirestoreException {
  const AbortedException() : super("The operation was aborted.");
}

class OutOfRangeException extends FirestoreException {
  const OutOfRangeException()
    : super("The operation was outside the valid range.");
}

class UnimplementedException extends FirestoreException {
  const UnimplementedException() : super("This operation is not supported.");
}

class InternalFirestoreException extends FirestoreException {
  const InternalFirestoreException()
    : super("An internal Firestore error occurred.");
}

class DataLossException extends FirestoreException {
  const DataLossException() : super("Data loss occurred.");
}

class UnauthenticatedException extends FirestoreException {
  const UnauthenticatedException() : super("Authentication is required.");
}

class UnknownFirestoreException extends FirestoreException {
  const UnknownFirestoreException()
    : super("An unexpected Firestore error occurred.");
}

class FirebaseFirestoreExceptionMapper {
  static AppException map(FirebaseException e) {
    switch (e.code) {
      case 'permission-denied':
        return const PermissionDeniedException();

      case 'not-found':
        return const DocumentNotFoundException();

      case 'already-exists':
        return const AlreadyExistsException();

      case 'cancelled':
        return const OperationCancelledException();

      case 'deadline-exceeded':
        return const DeadlineExceededException();

      case 'unavailable':
        return const ServiceUnavailableException();

      case 'network-request-failed':
        return const NetworkRequestFailedException();

      case 'invalid-argument':
        return const InvalidArgumentException();

      case 'resource-exhausted':
        return const ResourceExhaustedException();

      case 'failed-precondition':
        return const FailedPreconditionException();

      case 'aborted':
        return const AbortedException();

      case 'out-of-range':
        return const OutOfRangeException();

      case 'unimplemented':
        return const UnimplementedException();

      case 'internal':
        return const InternalFirestoreException();

      case 'data-loss':
        return const DataLossException();

      case 'unauthenticated':
        return const UnauthenticatedException();

      default:
        return const UnknownFirestoreException();
    }
  }
}
