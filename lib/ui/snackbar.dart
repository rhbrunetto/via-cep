import 'package:flutter/material.dart';

void showErrorSnackBar(BuildContext context, String message) =>
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.red[800],
        ),
      );
