import 'package:business_tracker/config/styles/app_dimensions.dart';
import 'package:business_tracker/config/theme/bloc/theme_bloc.dart';
import 'package:business_tracker/config/theme/bloc/theme_event.dart';
import 'package:business_tracker/config/theme/blue_theme.dart';
import 'package:business_tracker/config/theme/dark_theme.dart';
import 'package:business_tracker/config/theme/pink_theme.dart';
import 'package:business_tracker/config/theme/purple_theme.dart';
import 'package:business_tracker/features/common/presentation/widgets/CustomAppBar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/theme/light_theme.dart';
import '../../../../config/theme/bloc/theme_state.dart';

class SettingsPage extends StatefulWidget {
  static const String routeName = 'settings_page';
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final Map<String, ThemeData> _themes = {
    'Light Theme': lightTheme,
    'Dark Theme': darkTheme,
    'Blue Theme': blueTheme,
    'Purple Theme': purpleTheme,
    'Pink Theme': pinkTheme,
  };

  String _selectedTheme = 'Light Theme';

  @override
  Widget build(BuildContext context) {
    var dimensions = AppDimensions(context);
    return Scaffold(
      appBar: const CustomAppBar(title: 'Settings'),
      body: Padding(
        padding: dimensions.pagePaddingGlobal,
        child: Column(
          children: [
            _themeWidet(context),
            const Divider(
              height: 2,
            )
          ],
        ),
      ),
    );
  }

  Row _themeWidet(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Change Theme',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            // Set the _selectedTheme based on the current theme state
            _selectedTheme = _themes.entries
                .firstWhere((entry) => entry.value == state.theme)
                .key;

            return DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: _selectedTheme,
                items:
                    _themes.keys.map<DropdownMenuItem<String>>((String theme) {
                  return DropdownMenuItem<String>(
                    value: theme,
                    child: Text(theme),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedTheme = newValue!;
                    BlocProvider.of<ThemeBloc>(context).add(
                      ThemeChanged(_themes[_selectedTheme]!),
                    );
                  });
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
