import 'package:business_tracker/features/products/data/datasources/ProductRemoteDataSource.dart';
import 'package:business_tracker/features/products/domain/entities/CreateProductResponse.dart';
import 'package:business_tracker/features/products/domain/repositories/ProductRepository.dart';

class ProductRespositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRespositoryImpl(this.remoteDataSource);

  @override
  Future<CreateProductResponse> createProduct(
      Map<String, dynamic> product) async {
    final response = await remoteDataSource.createProduct(product);
    return response;
  }
}
