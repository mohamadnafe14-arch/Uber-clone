import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:uber_clone/core/services/check_connectivity_service.dart';
import 'package:uber_clone/firebase_options.dart';
import 'package:uber_clone/main.dart';

Future<void> initDependecyInjection() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  serviceLocator.registerLazySingleton<Connectivity>(() => Connectivity());
  serviceLocator.registerLazySingleton<CheckConnectivityService>(
    () => CheckConnectivityService(serviceLocator()),
  );
}
