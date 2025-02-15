import 'package:business_tracker/features/products/domain/entities/CreateProductResponse.dart';
import 'package:business_tracker/features/products/domain/entities/ProductsResponse.dart';

abstract class Productrepository {
  Future<CreateProductResponse> createProduct(Map<String, dynamic> product);

  Future<ProductsResponse> getProducts();
}
