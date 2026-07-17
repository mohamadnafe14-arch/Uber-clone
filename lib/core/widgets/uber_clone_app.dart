import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uber_clone/core/utils/app_router.dart';
import 'package:uber_clone/features/auth/presentation/manager/bloc/auth_bloc.dart';
import 'package:uber_clone/main.dart';

class UberCloneApp extends StatelessWidget {
  const UberCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<AuthBloc>(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
        theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black),
      ),
    );
  }
}
