import 'package:business_tracker/config/theme/bloc/theme_bloc.dart';
import 'package:business_tracker/config/theme/bloc/theme_state.dart';
import 'package:business_tracker/core/storage/token_storage.dart';
import 'package:business_tracker/core/utils/navigate_on_auth_success_helper.dart';
import 'package:business_tracker/core/utils/service_locator.dart';
import 'package:business_tracker/features/auth/presentation/blocs/login/auth_bloc.dart';
import 'package:business_tracker/features/auth/presentation/blocs/register/register_bloc.dart';
import 'package:business_tracker/features/auth/presentation/pages/auth_page.dart';
import 'package:business_tracker/features/company/presentation/blocs/get/get_company_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/routes/app_routes.dart';

void main() {
  // Ensuring native splash screen is displayed while loading
  // WidgetsBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: WidgetsBinding.instance);

  // Initialize service locator
  setupServiceLocator();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeBloc()),
        BlocProvider(create: (context) => RegisterBloc()),
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => GetCompanyBloc())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Business Tracker',
          theme: state.theme,
          onGenerateRoute: AppRoutes.generateRoute,
          home: _buildHome(),
        );
      },
    );
  }

  Widget _buildHome() {
    TokenStorage tokenStorage = TokenStorage();

    return FutureBuilder<String?>(
      future: tokenStorage.getAccessToken(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          String? accessToken = snapshot.data;
          if (accessToken != null && accessToken.isNotEmpty) {
            // Navigate based on the token
            WidgetsBinding.instance.addPostFrameCallback((_) {
              navigateOnAuthSuccess(context, accessToken);
            });
            // Return a placeholder while navigation is occurring
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          } else {
            return const AuthenticationPage();
          }
        }
      },
    );
  }
}
