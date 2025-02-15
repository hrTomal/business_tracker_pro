import 'package:business_tracker/features/products/data/datasources/ProductRemoteDataSource.dart';
import 'package:business_tracker/features/products/data/repository/ProductRepository.dart';
import 'package:business_tracker/features/products/domain/entities/CreateProductResponse.dart';
import 'package:business_tracker/features/products/domain/entities/ProductsResponse.dart';

class ProductRepositoryImpl extends Productrepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl(this.remoteDataSource);

  @override
  Future<CreateProductResponse> createProduct(
      Map<String, dynamic> product) async {
    final response = await remoteDataSource.createProduct(product);
    return response;
  }

  @override
  Future<ProductsResponse> getProducts() async {
    final response = await remoteDataSource.getProducts();
    return ProductsResponse.fromJson(response);
  }
}
