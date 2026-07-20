part of 'current_location_bloc.dart';

@immutable
sealed class CurrentLocationEvent {}

final class GetCurrentLocationEvent extends CurrentLocationEvent {}
