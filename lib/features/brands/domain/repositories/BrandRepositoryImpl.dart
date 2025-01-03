import 'package:business_tracker/features/brands/data/datasources/BrandRemoteDataSource.dart';
import 'package:business_tracker/features/brands/domain/entities/PaginatedBrandListResponse.dart';
import 'package:business_tracker/features/brands/domain/repositories/BrandRepository.dart';

class BrandRepositoryImpl implements Brandrepository {
  final Brandremotedatasource remoteDataSource;

  BrandRepositoryImpl(this.remoteDataSource);

  @override
  Future<PaginatedBrandListResponse> getBrands(int page) async {
    final response = await remoteDataSource.getBrands(page);
    return PaginatedBrandListResponse.fromJson(response);
  }
}
