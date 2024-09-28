import 'package:business_tracker/features/auth/domain/repositories/AuthenticationRepositoryImpl.dart';
import 'package:get_it/get_it.dart';
import 'package:business_tracker/features/auth/data/datasources/AuthenticationRemoteDataSource.dart';
import 'package:business_tracker/features/auth/domain/repositories/AuthenticationRepository.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // Register Remote Data Source
  getIt.registerLazySingleton<AuthenticationRemoteDataSource>(
      () => AuthenticationRemoteDataSource());

  // Register Repository
  getIt.registerLazySingleton<AuthenticationRepository>(() =>
      AuthenticationRepositoryImpl(getIt<AuthenticationRemoteDataSource>()));
}
