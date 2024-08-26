import 'package:flutter/material.dart';

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4282474385),
      surfaceTint: Color(4282474385),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4292273151),
      onPrimaryContainer: Color(4278197054),
      secondary: Color.fromARGB(255, 6, 6, 7),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4292535033),
      onSecondaryContainer: Color(4279442475),
      tertiary: Color(4285551989),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4294629629),
      onTertiaryContainer: Color(4280816430),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294572543),
      onSurface: Color(4279835680),
      onSurfaceVariant: Color(4282664782),
      outline: Color(4285822847),
      outlineVariant: Color(4291086032),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281217078),
      inversePrimary: Color(4289382399),
      primaryFixed: Color(4292273151),
      onPrimaryFixed: Color(4278197054),
      primaryFixedDim: Color(4289382399),
      onPrimaryFixedVariant: Color(4280829815),
      secondaryFixed: Color(4292535033),
      onSecondaryFixed: Color(4279442475),
      secondaryFixedDim: Color(4290692828),
      onSecondaryFixedVariant: Color(4282271577),
      tertiaryFixed: Color(4294629629),
      onTertiaryFixed: Color(4280816430),
      tertiaryFixedDim: Color(4292721888),
      onTertiaryFixedVariant: Color(4283907676),
      surfaceDim: Color(4292467168),
      surfaceBright: Color(4294572543),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294177786),
      surfaceContainer: Color(4293783028),
      surfaceContainerHigh: Color(4293388526),
      surfaceContainerHighest: Color(4293059305),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4289382399),
      surfaceTint: Color(4289382399),
      onPrimary: Color(4278857823),
      primaryContainer: Color(4280829815),
      onPrimaryContainer: Color(4292273151),
      secondary: Color(4290692828),
      onSecondary: Color(4280824129),
      secondaryContainer: Color(4282271577),
      onSecondaryContainer: Color(4292535033),
      tertiary: Color(4292721888),
      onTertiary: Color(4282329156),
      tertiaryContainer: Color(4283907676),
      onTertiaryContainer: Color(4294629629),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279309080),
      onSurface: Color(4293059305),
      onSurfaceVariant: Color(4291086032),
      outline: Color(4287533209),
      outlineVariant: Color(4282664782),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293059305),
      inversePrimary: Color(4282474385),
      primaryFixed: Color(4292273151),
      onPrimaryFixed: Color(4278197054),
      primaryFixedDim: Color(4289382399),
      onPrimaryFixedVariant: Color(4280829815),
      secondaryFixed: Color(4292535033),
      onSecondaryFixed: Color(4279442475),
      secondaryFixedDim: Color(4290692828),
      onSecondaryFixedVariant: Color(4282271577),
      tertiaryFixed: Color(4294629629),
      onTertiaryFixed: Color(4280816430),
      tertiaryFixedDim: Color(4292721888),
      onTertiaryFixedVariant: Color(4283907676),
      surfaceDim: Color(4279309080),
      surfaceBright: Color(4281809214),
      surfaceContainerLowest: Color(4278980115),
      surfaceContainerLow: Color(4279835680),
      surfaceContainer: Color(4280098852),
      surfaceContainerHigh: Color(4280822319),
      surfaceContainerHighest: Color(4281546042),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme blueScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF2196F3),
      surfaceTint: Color(0xFF2196F3),
      onPrimary: Color(0xFFFFFFFF),
      primaryContainer: Color(0xFFBBDEFB),
      onPrimaryContainer: Color(0xFF0D47A1),
      secondary: Color(0xFF64B5F6),
      onSecondary: Color(0xFFFFFFFF),
      secondaryContainer: Color(0xFFB3E5FC),
      onSecondaryContainer: Color(0xFF01579B),
      tertiary: Color(0xFF1976D2),
      onTertiary: Color(0xFFFFFFFF),
      tertiaryContainer: Color(0xFF82B1FF),
      onTertiaryContainer: Color(0xFF0D47A1),
      error: Color(0xFFB00020),
      onError: Color(0xFFFFFFFF),
      errorContainer: Color(0xFFFF8A80),
      onErrorContainer: Color(0xFFC62828),
      surface: Color(0xFFBBDEFB),
      onSurface: Color(0xFF212121),
      onSurfaceVariant: Color(0xFF757575),
      outline: Color(0xFFBDBDBD),
      outlineVariant: Color(0xFFE0E0E0),
      shadow: Color(0xFF000000),
      scrim: Color(0xFF000000),
      inverseSurface: Color(0xFF424242),
      inversePrimary: Color(0xFF64B5F6),
      primaryFixed: Color(0xFF0D47A1),
      onPrimaryFixed: Color(0xFFBBDEFB),
      primaryFixedDim: Color(0xFF2196F3),
      onPrimaryFixedVariant: Color(0xFF1976D2),
      secondaryFixed: Color(0xFF64B5F6),
      onSecondaryFixed: Color(0xFF82B1FF),
      secondaryFixedDim: Color(0xFF2196F3),
      onSecondaryFixedVariant: Color(0xFF01579B),
      tertiaryFixed: Color(0xFF1976D2),
      onTertiaryFixed: Color(0xFF0D47A1),
      tertiaryFixedDim: Color(0xFF82B1FF),
      onTertiaryFixedVariant: Color(0xFF1976D2),
      surfaceDim: Color(0xFFBBDEFB),
      surfaceBright: Color(0xFFE3F2FD),
      surfaceContainerLowest: Color(0xFF2196F3),
      surfaceContainerLow: Color(0xFF64B5F6),
      surfaceContainer: Color(0xFFBBDEFB),
      surfaceContainerHigh: Color(0xFF82B1FF),
      surfaceContainerHighest: Color(0xFF0D47A1),
    );
  }

  ThemeData blue() {
    return theme(blueScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily dark;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.dark,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
