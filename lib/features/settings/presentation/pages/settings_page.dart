import 'package:business_tracker/config/styles/app_dimensions.dart';
import 'package:business_tracker/config/theme/bloc/theme_bloc.dart';
import 'package:business_tracker/config/theme/bloc/theme_event.dart';
import 'package:business_tracker/config/theme/blue_theme.dart';
import 'package:business_tracker/config/theme/dark_theme.dart';
import 'package:business_tracker/config/theme/pink_theme.dart';
import 'package:business_tracker/config/theme/purple_theme.dart';
import 'package:business_tracker/features/auth/presentation/pages/auth_page.dart';
import 'package:business_tracker/features/common/presentation/widgets/CustomAppBar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/theme/light_theme.dart';
import '../../../../config/theme/bloc/theme_state.dart';
import '../../../auth/presentation/blocs/login/auth_bloc.dart';
import '../../../auth/presentation/blocs/login/auth_event.dart';

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _themeWidet(context),
            const Divider(height: 20),
            _logoutButton(context),
          ],
        ),
      ),
    );
  }

  // Theme selection widget
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

  // Logout button
  Widget _logoutButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        // Trigger the logout event
        context.read<AuthBloc>().add(LogoutRequested());

        // Optionally navigate to the login page or any other page after logout
        Navigator.of(context).pushReplacementNamed(
          AuthenticationPage.routeName,
        );
      },
      icon: const Icon(Icons.logout),
      label: const Text('Logout'),
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.error,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        textStyle: const TextStyle(fontSize: 18),
      ),
    );
  }
}
