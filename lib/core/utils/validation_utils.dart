import 'package:flutter/material.dart';

class ValidationUtils {
  // Function to validate a list of controllers and return a list of error messages
  static List<String> validateTextFields(
    List<Map<String, dynamic>> fields,
  ) {
    final List<String> errorMessages = [];

    for (var field in fields) {
      final controller = field['controller'] as TextEditingController;
      final errorMessage = field['errorMessage'] as String;

      if (controller.text.isEmpty) {
        errorMessages.add(errorMessage);
      }
    }

    return errorMessages;
  }
}
