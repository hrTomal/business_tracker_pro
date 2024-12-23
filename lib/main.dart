import 'package:business_tracker/config/theme/bloc/theme_bloc.dart';
import 'package:business_tracker/config/theme/bloc/theme_state.dart';
import 'package:business_tracker/core/storage/token_storage.dart';
import 'package:business_tracker/core/utils/service_locator.dart';
import 'package:business_tracker/features/auth/presentation/blocs/login/auth_bloc.dart';
import 'package:business_tracker/features/auth/presentation/blocs/register/register_bloc.dart';
import 'package:business_tracker/features/auth/presentation/pages/auth_page.dart';
import 'package:business_tracker/features/company/presentation/blocs/get/get_company_bloc.dart';
import 'package:business_tracker/features/company/presentation/blocs/get/get_company_event.dart';
import 'package:business_tracker/features/company/presentation/blocs/get/get_company_state.dart';
import 'package:business_tracker/features/company/presentation/pages/create_company.dart';
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
      BlocProvider(create: (context) => AuthBloc()),
      BlocProvider(create: (context) => GetCompanyBloc())
    ],
    child: const MyApp(),
  )
      // BlocProvider(
      //   create: (context) => ThemeBloc(),

      // ),
      );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

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

          if (accessToken != null) {
            // User is logged in, fetch companies
            return BlocProvider(
              create: (context) =>
                  GetCompanyBloc()..add(const GetCompanyListRequested(page: 1)),
              child: BlocBuilder<GetCompanyBloc, GetCompanyState>(
                builder: (context, state) {
                  if (state is GetCompanyLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is GetCompanyListSuccess) {
                    if (state.companies!.isEmpty) {
                      return const CreateCompanyPage(); // No companies
                    } else if (state.companies!.length == 1) {
                      return const Dashboard(); // Single company
                    } else {
                      return const Dashboard(); // Default fallback
                    }
                  } else if (state is GetCompanyFailure) {
                    // return Center(child: Text('Error: ${state.error}'));
                    return const AuthenticationPage();
                  }

                  return const Center(
                      child:
                          CircularProgressIndicator()); // Default loading state
                },
              ),
            );
          } else {
            // User is not logged in
            return const AuthenticationPage();
          }
        }
      },
    );
  }
}
