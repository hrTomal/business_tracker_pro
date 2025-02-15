import 'package:business_tracker/config/theme/bloc/theme_bloc.dart';
import 'package:business_tracker/config/theme/bloc/theme_state.dart';
import 'package:business_tracker/core/storage/token_storage.dart';
import 'package:business_tracker/core/utils/navigate_on_auth_success_helper.dart';
import 'package:business_tracker/core/utils/service_locator.dart';
import 'package:business_tracker/features/attribute-types/data/repository/AttributeTypeRepository.dart';
import 'package:business_tracker/features/attribute-types/presentation/blocs/AttributeTypeCubit.dart';
import 'package:business_tracker/features/attributes/data/repository/attribute_repository.dart';
import 'package:business_tracker/features/attributes/presentation/blocs/attribute_cubit.dart';
import 'package:business_tracker/features/auth/presentation/blocs/login/auth_bloc.dart';
import 'package:business_tracker/features/auth/presentation/blocs/register/register_bloc.dart';
import 'package:business_tracker/features/auth/presentation/pages/auth_page.dart';
import 'package:business_tracker/features/categories/domain/repositories/CategoryRepository.dart';
import 'package:business_tracker/features/categories/presentation/blocs/category_cubit.dart';
import 'package:business_tracker/features/company/presentation/blocs/get/get_company_bloc.dart';
import 'package:business_tracker/features/products/data/repository/ProductRepository.dart';
import 'package:business_tracker/features/products/presentation/blocs/products_cubit.dart';
import 'package:business_tracker/features/purchase/data/repository/purchase_repository_impl.dart';
import 'package:business_tracker/features/purchase/presentation/blocs/purchase_cubit.dart';
import 'package:business_tracker/features/vendor/data/repository/vendor_repository.dart';
import 'package:business_tracker/features/vendor/presentation/blocs/vendors_cubit.dart';
import 'package:business_tracker/features/warehouse/data/repository/warehouse_repository.dart';
import 'package:business_tracker/features/warehouse/presentation/blocs/warehouse_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/routes/app_routes.dart';

void main() {
  // Initialize service locator
  setupServiceLocator();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeBloc()),
        BlocProvider(create: (context) => RegisterBloc()),
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => GetCompanyBloc()),
        BlocProvider(
          create: (context) =>
              CategoryCubit(categoryRepository: getIt<CategoryRepository>()),
        ),
        BlocProvider(
          create: (context) =>
              Attributetypecubit(getIt<AttributeTypeRepository>()),
        ),
        BlocProvider(
          create: (context) => AttributeCubit(getIt<AttributeRepository>()),
        ),
        BlocProvider(
          create: (context) => VendorCubit(getIt<VendorRepository>()),
        ),
        BlocProvider(
          create: (context) => ProductsCubit(getIt<Productrepository>()),
        ),
        BlocProvider(
          create: (context) => PurchaseCubit(getIt<PurchaseRepository>()),
        ),
        BlocProvider(
          create: (context) => WarehouseCubit(getIt<WarehouseRepository>()),
        ),
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
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          String? accessToken = snapshot.data;
          if (accessToken != null && accessToken.isNotEmpty) {
            // Navigate based on the token
            WidgetsBinding.instance.addPostFrameCallback((_) {
              navigateOnAuthSuccess(context, accessToken);
            });
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
