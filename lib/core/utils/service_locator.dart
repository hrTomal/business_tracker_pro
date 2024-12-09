import 'package:business_tracker/features/auth/domain/repositories/AuthenticationRepositoryImpl.dart';
import 'package:business_tracker/features/company/data/datasources/CompanyRemoteDataSource.dart';
import 'package:business_tracker/features/company/domain/repositories/CompanyRepository.dart';
import 'package:business_tracker/features/company/domain/repositories/CompanyRepositoryImpl.dart';
import 'package:business_tracker/features/products/data/datasources/ProductRemoteDataSource.dart';
import 'package:business_tracker/features/products/domain/repositories/ProductRepository.dart';
import 'package:business_tracker/features/products/domain/repositories/ProductRespositoryImpl.dart';
import 'package:get_it/get_it.dart';
import 'package:business_tracker/features/auth/data/datasources/AuthenticationRemoteDataSource.dart';
import 'package:business_tracker/features/auth/domain/repositories/AuthenticationRepository.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // Register Remote Data Source
  getIt.registerLazySingleton<AuthenticationRemoteDataSource>(
      () => AuthenticationRemoteDataSource());
  getIt.registerLazySingleton<CompanyRemoteDataSource>(
      () => CompanyRemoteDataSource());
  getIt.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSource());

  // Register Repository
  getIt.registerLazySingleton<AuthenticationRepository>(() =>
      AuthenticationRepositoryImpl(getIt<AuthenticationRemoteDataSource>()));

  getIt.registerLazySingleton<CompanyRepository>(
      () => CompanyRepositoryImpl(getIt<CompanyRemoteDataSource>()));

  getIt.registerLazySingleton<ProductRepository>(
      () => ProductRespositoryImpl(getIt<ProductRemoteDataSource>()));
}
