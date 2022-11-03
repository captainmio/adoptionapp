import 'package:flutter/material.dart';

class GSnackbar {
  static show(
    BuildContext context, {
    required String type,
    required String message,
  }) {
    Color defaulBG = Colors.green;

    if (type == 'error') {
      defaulBG = Colors.redAccent;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: defaulBG,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.fromLTRB(50, 25, 50, 25),
        elevation: 30,
      ),
    );
  }
}
