import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:uber_clone/core/services/check_connectivity_service.dart';
import 'package:uber_clone/features/auth/data/data_sources/remote_auth_data_source.dart';
import 'package:uber_clone/features/auth/data/repos/auth_repo_imple.dart';
import 'package:uber_clone/features/auth/domain/repos/auth_repo.dart';
import 'package:uber_clone/features/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:uber_clone/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:uber_clone/features/auth/presentation/manager/bloc/auth_bloc.dart';
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
  serviceLocator.registerFactory(
    () => AuthBloc(
      signInUseCase: serviceLocator(),
      signUpUseCase: serviceLocator(),
    ),
  );
}
