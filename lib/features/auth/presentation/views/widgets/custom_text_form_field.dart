import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.validator,
    required this.hintText,
    required this.obscureText,
    required this.controller,
  });
  final String? Function(String?)? validator;
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: _getBorder(),
        focusedBorder: _getBorder(Colors.blue),
        enabledBorder: _getBorder(),
        errorBorder: _getBorder(Colors.red),
        hint: Text(hintText, style: TextStyle(color: Colors.grey)),
      ),
    );
  }

  OutlineInputBorder _getBorder([Color color = Colors.black]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: color),
    );
  }
}
