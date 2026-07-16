import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uber_clone/core/utils/app_router.dart';
import 'package:uber_clone/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:uber_clone/features/auth/presentation/views/widgets/custom_text_button.dart';
import 'package:uber_clone/features/auth/presentation/views/widgets/custom_text_form_field.dart';

class SignInBody extends StatefulWidget {
  const SignInBody({super.key});

  @override
  State<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  late TextEditingController _emailController, _passwordController;
  late GlobalKey<FormState> _formKey;
  @override
  initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _formKey.currentState?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Image.asset(
                'assets/users app images/logo.png',
                width: 200,
                height: 200,
              ),
              SizedBox(height: 20),
              Text(
                "Sign Up",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              CustomTextFormField(
                hintText: "Email",
                controller: _emailController,
                obscureText: false,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your email";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              CustomTextFormField(
                hintText: "Password",
                controller: _passwordController,
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your password";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              CustomButton(
                text: "Sign In",
                onClicked: () {
                  if (_formKey.currentState!.validate()) {}
                },
              ),
              SizedBox(height: 20),
              CustomTextButton(
                text: "If you don't have an account? Sign up",
                onClicked: () {
                  context.push(AppRouter.initialRoute);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
