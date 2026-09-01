import 'package:flutter/material.dart';

void showSnackBarMessage(BuildContext context, String message,
    [bool isError = false]) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: isError ? Colors.red : Colors.green,
      behavior: SnackBarBehavior.floating, // floating makes it appear above bottom
      margin: EdgeInsets.only(
        top: 20.0,    // top position
        left: 16.0,   // side padding
        right: 16.0,  // side padding
      ),
    ),
  );
}
