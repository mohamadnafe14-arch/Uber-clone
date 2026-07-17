import 'package:flutter/material.dart';
import 'package:uber_clone/core/utils/dependecy_injection.dart';
import 'package:uber_clone/core/widgets/uber_clone_app.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependecyInjection();
  runApp(const UberCloneApp());
}
