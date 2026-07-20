import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uber_clone/core/utils/app_router.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  @override
  initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      // ignore: use_build_context_synchronously
      context.go(AppRouter.signUpRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Image(image: AssetImage('assets/users app images/logo.png')),
    );
  }
}
