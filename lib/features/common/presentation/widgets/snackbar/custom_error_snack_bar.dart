import 'package:flutter/material.dart';

void showErrorSnackbar({
  required BuildContext context,
  required List<String> errors,
  Duration duration = const Duration(seconds: 4),
}) {
  final theme = Theme.of(context);

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: errors
            .asMap() // Convert the list to a map to access the index
            .map((index, error) => MapEntry(
                  index,
                  Text(
                    'Error ${index + 1}: $error',
                    style: TextStyle(color: theme.colorScheme.onError),
                  ),
                ))
            .values
            .toList(),
      ),
      backgroundColor: theme.colorScheme.error,
      duration: duration,
    ),
  );
}
