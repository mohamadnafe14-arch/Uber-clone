import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text) {
  final messenger = ScaffoldMessenger.of(context);

  messenger
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(text)));
}
