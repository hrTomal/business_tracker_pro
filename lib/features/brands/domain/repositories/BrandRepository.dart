import 'package:business_tracker/features/brands/domain/entities/PaginatedBrandListResponse.dart';

abstract class Brandrepository {
  Future<PaginatedBrandListResponse> getBrands(int page);
}
