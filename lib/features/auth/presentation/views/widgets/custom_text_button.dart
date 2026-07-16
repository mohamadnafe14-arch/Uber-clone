import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.text,
    required this.onClicked,
  });
  final String text;
  final VoidCallback onClicked;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onClicked,
      child: Text(text, style: const TextStyle(color: Colors.white)),
    );
  }
}
