import 'package:business_tracker/core/utils/api_client.dart';
import 'package:business_tracker/features/products/domain/entities/CreateProductResponse.dart';

class ProductRemoteDataSource {
  final ApiClient _apiClient = ApiClient();

  Future<CreateProductResponse> createProduct(
      Map<String, dynamic> product) async {
    try {
      // Make the API request and get the response
      final response = await _apiClient.request(
        'POST',
        '/product/products/',
        body: {
          "is_active": true,
          "name": product["name"] ?? "",
          "retail_price": product["retailPrice"] ?? "",
          "wholesale_price": product["wholesalePrice"] ?? "",
          "additional_identifier": product["additionalIdentifier"] ?? "",
          "description": product["description"] ?? "",
        },
      );

      // Parse the response into CreateProductResponse
      return CreateProductResponse.fromJson(response);
    } catch (e) {
      // Throw detailed exception for easier debugging
      throw Exception('Failed to create product: ${e.toString()}');
    }
  }
}
