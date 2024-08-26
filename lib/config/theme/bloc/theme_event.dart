import 'package:flutter/material.dart';
import 'package:business_tracker/config/theme/dark_theme.dart';
import 'package:business_tracker/config/theme/blue_theme.dart';
import 'package:business_tracker/config/theme/light_theme.dart';
import 'package:business_tracker/config/theme/purple_theme.dart';

abstract class ThemeEvent {}

class ThemeChanged extends ThemeEvent {
  final ThemeData theme;
  ThemeChanged(this.theme);
}
