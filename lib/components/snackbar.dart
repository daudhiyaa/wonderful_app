import 'package:flutter/material.dart';

SnackBar customSnackBar(String message) {
  return SnackBar(
    content: Text(message),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.blueGrey,
    elevation: 6.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  );
}

void showCustomSnackBar(BuildContext context, String message) {
  final snackBar = customSnackBar(message);
  if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
