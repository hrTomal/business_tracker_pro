import 'package:business_tracker/config/theme/material_theme.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  // appBarTheme: const AppBarTheme(
  //   color: Colors.blue,
  // ),
  colorScheme: MaterialTheme.lightScheme(),
  radioTheme: RadioThemeData(
    fillColor: WidgetStateProperty.resolveWith<Color?>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return MaterialTheme.lightScheme().primary;
        }
        return null; // Defer to the default value
      },
    ),
  ),
  // textTheme: TextTheme(
  //   titleLarge: TextStyle(
  //     fontSize: 32,
  //     fontWeight: FontWeight.bold,
  //     color: MaterialTheme.lightScheme().onSurface,
  //   ), // Title style
  //   titleMedium: TextStyle(
  //     fontSize: 24,
  //     fontWeight: FontWeight.bold,
  //     color: MaterialTheme.lightScheme().onSurface,
  //   ), // Subtitle style
  //   titleSmall: TextStyle(
  //     fontSize: 20,
  //     fontWeight: FontWeight.w600,
  //     color: MaterialTheme.lightScheme().onSurfaceVariant,
  //   ), // Label style
  //   bodyLarge: TextStyle(
  //     fontSize: 16,
  //     fontWeight: FontWeight.normal,
  //     color: MaterialTheme.lightScheme().onSurface,
  //   ), // Description style
  //   bodyMedium: TextStyle(
  //     fontSize: 14,
  //     fontWeight: FontWeight.normal,
  //     color: MaterialTheme.lightScheme().onSurface,
  //   ), // Additional text style
  //   bodySmall: TextStyle(
  //     fontSize: 12,
  //     fontWeight: FontWeight.normal,
  //     color: MaterialTheme.lightScheme().outline,
  //   ),
  //   labelLarge: TextStyle(
  //     fontSize: 20,
  //     fontWeight: FontWeight.w600,
  //     color: MaterialTheme.lightScheme().primary,
  //   ),
  //   labelMedium: TextStyle(
  //     fontSize: 16,
  //     fontWeight: FontWeight.w600,
  //     color: MaterialTheme.lightScheme().primary,
  //   ),
  // ),
);
