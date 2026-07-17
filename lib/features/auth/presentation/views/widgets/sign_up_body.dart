import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:uber_clone/core/functions/show_snack_bar.dart';
import 'package:uber_clone/core/utils/app_router.dart';
import 'package:uber_clone/features/auth/presentation/manager/bloc/auth_bloc.dart';
import 'package:uber_clone/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:uber_clone/features/auth/presentation/views/widgets/custom_text_button.dart';
import 'package:uber_clone/features/auth/presentation/views/widgets/custom_text_form_field.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  late TextEditingController _emailController,
      _passwordController,
      _nameController,
      _phoneController;
  late GlobalKey<FormState> _formKey;
  @override
  initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
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
                hintText: "Name",
                controller: _nameController,
                obscureText: false,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your name";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              CustomTextFormField(
                hintText: "Phone",
                controller: _phoneController,
                obscureText: false,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your phone";
                  }
                  if (!RegExp(
                    r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$',
                  ).hasMatch(value)) {
                    return "Please enter a valid phone number";
                  }
                  return null;
                },
              ),
              CustomTextFormField(
                hintText: "Email",
                controller: _emailController,
                obscureText: false,
                validator: (value) {
                  if (!RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                  ).hasMatch(value!)) {
                    return "Please enter a valid email";
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
              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthSuccess) {
                    context.go(AppRouter.homeRoute);
                  } else if (state is AuthError) {
                    showSnackBar(context, state.message);
                  }
                },
                builder: (context, state) {
                  return CustomButton(
                    text: "Sign up",
                    onClicked: state is AuthLoading
                        ? null
                        : () {
                            if (_formKey.currentState!.validate()) {
                              context.read<AuthBloc>().add(
                                SignUpEvent(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                  name: _nameController.text,
                                  phone: _phoneController.text,
                                ),
                              );
                            }
                          },
                    isLoading: state is AuthLoading,
                  );
                },
              ),
              SizedBox(height: 20),
              CustomTextButton(
                text: "If you have an account? Sign in",
                onClicked: () {
                  context.push(AppRouter.signInRoute);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
