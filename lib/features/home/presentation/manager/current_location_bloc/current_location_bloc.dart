import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uber_clone/features/home/domain/entities/user_location_entity.dart';
import 'package:uber_clone/features/home/domain/repos/current_location_repo.dart';

part 'current_location_event.dart';
part 'current_location_state.dart';

class CurrentLocationBloc
    extends Bloc<CurrentLocationEvent, CurrentLocationState> {
  final CurrentLocationRepo currentLocationRepo;
  CurrentLocationBloc({required this.currentLocationRepo})
    : super(CurrentLocationInitial()) {
    on<GetCurrentLocationEvent>((event, emit) async {
      emit(CurrentLocationLoading());

      final result = await currentLocationRepo.getCurrentLocation();

      await result.fold(
        (failure) async {
          emit(CurrentLocationError(failure.message));
        },
        (stream) async {
          await emit.forEach(
            stream,
            onData: (userLocation) {
              return CurrentLocationSuccess(userLocation);
            },
            onError: (error, stackTrace) {
              return CurrentLocationError(error.toString());
            },
          );
        },
      );
    });
  }
}
