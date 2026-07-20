part of 'current_location_bloc.dart';

@immutable
sealed class CurrentLocationState {}

final class CurrentLocationInitial extends CurrentLocationState {}

final class CurrentLocationLoading extends CurrentLocationState {}

final class CurrentLocationSuccess extends CurrentLocationState {
  final UserLocationEntity userLocationEntity;
  CurrentLocationSuccess(this.userLocationEntity);
}

final class CurrentLocationError extends CurrentLocationState {
  final String message;
  CurrentLocationError(this.message);
}
