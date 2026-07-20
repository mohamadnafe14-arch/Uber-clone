import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uber_clone/features/home/presentation/manager/current_location_bloc/current_location_bloc.dart';
import 'package:uber_clone/features/home/presentation/views/widgets/home_body.dart';
import 'package:uber_clone/main.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  DateTime? _lastBackPressed;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;

        final now = DateTime.now();

        if (_lastBackPressed == null ||
            now.difference(_lastBackPressed!) > const Duration(seconds: 2)) {
          _lastBackPressed = now;

          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text("Tap back again to exit"),
                duration: Duration(seconds: 2),
              ),
            );
        } else {
          SystemNavigator.pop();
        }
      },
      child: BlocProvider(
        create: (context) => serviceLocator<CurrentLocationBloc>(),
        child: Scaffold(
          appBar: AppBar(title: const Text("Home")),
          body: HomeBody(),
        ),
      ),
    );
  }
}
