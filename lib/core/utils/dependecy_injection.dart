import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:uber_clone/core/services/check_connectivity_service.dart';
import 'package:uber_clone/features/auth/data/data_sources/remote_auth_data_source.dart';
import 'package:uber_clone/features/auth/data/repos/auth_repo_imple.dart';
import 'package:uber_clone/features/auth/domain/repos/auth_repo.dart';
import 'package:uber_clone/features/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:uber_clone/features/auth/domain/use_cases/sign_out_use_case.dart';
import 'package:uber_clone/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:uber_clone/features/auth/presentation/manager/bloc/auth_bloc.dart';
import 'package:uber_clone/features/home/data/data_sources/remote_location_data_source.dart';
import 'package:uber_clone/features/home/data/repos/current_location_repo_imple.dart';
import 'package:uber_clone/features/home/domain/repos/current_location_repo.dart';
import 'package:uber_clone/features/home/domain/usecases/get_current_location_use_case.dart';
import 'package:uber_clone/features/home/presentation/manager/current_location_bloc/current_location_bloc.dart';
import 'package:uber_clone/firebase_options.dart';
import 'package:uber_clone/main.dart';

Future<void> initDependecyInjection() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  serviceLocator.registerLazySingleton<Connectivity>(() => Connectivity());
  serviceLocator.registerLazySingleton<CheckConnectivityService>(
    () => CheckConnectivityService(serviceLocator()),
  );
  serviceLocator.registerLazySingleton(() => FirebaseAuth.instance);
  serviceLocator.registerLazySingleton(() => FirebaseFirestore.instance);

  serviceLocator.registerLazySingleton<RemoteAuthDataSource>(
    () => RemoteAuthDataSourceImpl(
      firebaseAuth: serviceLocator(),
      firebaseFirestore: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<AuthRepo>(
    () => AuthRepoImple(
      remoteAuthDataSource: serviceLocator(),
      checkConnectivityService: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(() => SignInUseCase(serviceLocator()));
  serviceLocator.registerLazySingleton(() => SignUpUseCase(serviceLocator()));
  serviceLocator.registerLazySingleton(() => SignOutUseCase(serviceLocator()));
  serviceLocator.registerFactory(
    () => AuthBloc(
      signInUseCase: serviceLocator(),
      signUpUseCase: serviceLocator(),
      signOutUseCase: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<RemoteLocationDataSource>(
    () => RemoteLocationDataSourceImpl(),
  );
  serviceLocator.registerLazySingleton<CurrentLocationRepo>(
    () => CurrentLocationRepoImple(serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => GetCurrentLocationUseCase(serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => CurrentLocationBloc(currentLocationRepo: serviceLocator()),
  );
}
