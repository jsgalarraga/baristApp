import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Toast {
  static final FToast fToast = FToast();

  static void showCenteredToast(
    BuildContext context, {
    required String message,
    Duration? duration,
  }) {
    final theme = Theme.of(context);
    fToast
      ..init(context)
      ..showToast(
        toastDuration: duration ?? const Duration(seconds: 3),
        positionedToastBuilder: (context, child) => Center(child: child),
        child: Card(
          color: theme.buttonTheme.colorScheme?.primary,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      );
  }
}
