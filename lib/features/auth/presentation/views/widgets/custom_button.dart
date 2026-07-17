import 'package:flutter/material.dart';
import 'package:uber_clone/core/constants/colors_consts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onClicked,
    required this.isLoading,
  });
  final String text;
  final VoidCallback onClicked;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClicked,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        backgroundColor: customButtonColor,
      ),
      child: isLoading
          ? const CircularProgressIndicator()
          : Text(text, style: const TextStyle(color: Colors.white)),
    );
  }
}
