import 'package:business_tracker/config/theme/bloc/theme_bloc.dart';
import 'package:business_tracker/config/theme/bloc/theme_state.dart';
import 'package:business_tracker/core/storage/token_storage.dart';
import 'package:business_tracker/core/utils/service_locator.dart';
import 'package:business_tracker/features/auth/presentation/blocs/register/register_bloc.dart';
import 'package:business_tracker/features/auth/presentation/pages/register_page.dart';
import 'package:business_tracker/features/dashboard/presentation/pages/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'config/routes/app_routes.dart';

void main() {
  // Ensuring native splash screen is displayed while loading
  // WidgetsBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: WidgetsBinding.instance);

  // Initialize service locator
  setupServiceLocator();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => ThemeBloc()),
      BlocProvider(create: (context) => RegisterBloc()),
    ],
    child: MyApp(),
  )
      // BlocProvider(
      //   create: (context) => ThemeBloc(),

      // ),
      );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Business Tracker',
          theme: state.theme,
          onGenerateRoute: AppRoutes.generateRoute,
          // You can decide which page to show based on authentication status
          home: _buildHome(),
        );
      },
    );
  }

  Widget _buildHome() {
    TokenStorage _tokenStorage = TokenStorage();

    return FutureBuilder<String?>(
      future: _tokenStorage.getAccessToken(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: const CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          String? accessToken = snapshot.data;

          if (accessToken != null) {
            return Dashboard(); // User is logged in
          } else {
            return RegisterPage(); // User is not logged in
          }
        }
      },
    );
  }
}
