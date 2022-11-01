import 'package:flutter/material.dart';

class GSnackbar {
  static show(
    BuildContext context, {
    required String type,
    required String message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
