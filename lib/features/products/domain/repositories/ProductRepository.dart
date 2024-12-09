import 'package:business_tracker/features/products/domain/entities/CreateProductResponse.dart';

abstract class ProductRepository {
  Future<CreateProductResponse> createProduct(Map<String, dynamic> product);
}
