import 'package:business_tracker/features/attribute-types/data/datasources/AttributeTypeDataSource.dart';
import 'package:business_tracker/features/attribute-types/data/repository/AttributeTypeRepository.dart';
import 'package:business_tracker/features/attribute-types/data/repository/AttributeTypeRepositoryImpl.dart';
import 'package:business_tracker/features/attributes/data/datasources/attribute_remote_data_source.dart';
import 'package:business_tracker/features/attributes/data/repository/attribute_repository.dart';
import 'package:business_tracker/features/attributes/data/repository/attribute_repository_impl.dart';
import 'package:business_tracker/features/auth/domain/repositories/AuthenticationRepositoryImpl.dart';
import 'package:business_tracker/features/brands/data/datasources/BrandRemoteDataSource.dart';
import 'package:business_tracker/features/brands/domain/repositories/BrandRepository.dart';
import 'package:business_tracker/features/brands/domain/repositories/BrandRepositoryImpl.dart';
import 'package:business_tracker/features/categories/data/datasources/CategoryRemoteSource.dart';
import 'package:business_tracker/features/categories/domain/repositories/CategoryRepository.dart';
import 'package:business_tracker/features/categories/domain/repositories/CategoryRepositoryImpl.dart';
import 'package:business_tracker/features/company/data/datasources/CompanyRemoteDataSource.dart';
import 'package:business_tracker/features/company/domain/repositories/CompanyRepository.dart';
import 'package:business_tracker/features/company/domain/repositories/CompanyRepositoryImpl.dart';
import 'package:business_tracker/features/products/data/datasources/ProductRemoteDataSource.dart';
import 'package:business_tracker/features/products/domain/repositories/ProductRepository.dart';
import 'package:business_tracker/features/products/domain/repositories/ProductRespositoryImpl.dart';
import 'package:business_tracker/features/vendor/data/datasources/vendor_remote_data_source.dart';
import 'package:business_tracker/features/vendor/data/repository/vendor_repository.dart';
import 'package:business_tracker/features/vendor/data/repository/vendor_repository_impl.dart';
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
  getIt.registerLazySingleton<Brandremotedatasource>(
      () => Brandremotedatasource());
  getIt.registerLazySingleton<CategoryRemoteSource>(
      () => CategoryRemoteSource());
  getIt.registerLazySingleton<Attributetypedatasource>(
      () => Attributetypedatasource());
  getIt.registerLazySingleton<AttributeRemoteDataSource>(
      () => AttributeRemoteDataSource());
  getIt.registerLazySingleton<VendorDataSource>(() => VendorDataSource());

  // Register Repository
  getIt.registerLazySingleton<AuthenticationRepository>(() =>
      AuthenticationRepositoryImpl(getIt<AuthenticationRemoteDataSource>()));

  getIt.registerLazySingleton<CompanyRepository>(
      () => CompanyRepositoryImpl(getIt<CompanyRemoteDataSource>()));

  getIt.registerLazySingleton<ProductRepository>(
      () => ProductRespositoryImpl(getIt<ProductRemoteDataSource>()));

  getIt.registerLazySingleton<Brandrepository>(
      () => BrandRepositoryImpl(getIt<Brandremotedatasource>()));

  getIt.registerLazySingleton<CategoryRepository>(
      () => CategoryRepositoryImpl(getIt<CategoryRemoteSource>()));

  getIt.registerLazySingleton<AttributeTypeRepository>(
      () => AttributeTypeRepositoryImpl(getIt<Attributetypedatasource>()));

  getIt.registerLazySingleton<AttributeRepository>(
      () => AttributeRepositoryImpl(getIt<AttributeRemoteDataSource>()));

  getIt.registerLazySingleton<VendorRepository>(
      () => VendorRepositoryImpl(getIt<VendorDataSource>()));
}
