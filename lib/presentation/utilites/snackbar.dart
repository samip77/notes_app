import 'package:flutter/material.dart';

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

extension ScaffoldMessengerStateExtension on ScaffoldMessengerState? {
  void showSnackbarMessage(
    final String message, {
    final Function()? onTap,
    final Widget? titleWidget,
  }) {
    this?.hideCurrentSnackBar();
    this?.showSnackBar(
      SnackBar(
        content: Container(
          padding: const EdgeInsets.all(24.0),
          child: Text(message),
        ),
      ),
    );
  }
}
