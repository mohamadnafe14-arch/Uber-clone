import 'package:flutter/material.dart';
import 'package:uber_clone/features/auth/presentation/views/widgets/splash_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SplashBody());
  }
}
