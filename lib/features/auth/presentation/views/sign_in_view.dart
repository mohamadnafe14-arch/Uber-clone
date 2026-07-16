import 'package:flutter/material.dart';
import 'package:uber_clone/features/auth/presentation/views/widgets/sign_in_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SignInBody());
  }
}
