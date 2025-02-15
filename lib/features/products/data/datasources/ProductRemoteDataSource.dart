import 'package:business_tracker/core/utils/api_client.dart';
import 'package:business_tracker/features/products/domain/entities/CreateProductResponse.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
          "name": product["name"] ?? "",
          "is_active": true,
          "retail_price": product["retailPrice"] ?? "0",
          "wholesale_price": product["wholesalePrice"] ?? "0",
          "additional_identifier": product["additionalIdentifier"] ?? "",
          "description": product["description"] ?? "",
          "company": product["companyId"] ?? 0,
        },
      );

      // Parse the response into CreateProductResponse
      return CreateProductResponse.fromJson(response);
    } catch (e) {
      // Throw detailed exception for easier debugging
      throw Exception('Failed to create product: ${e.toString()}');
    }
  }

  getProducts() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final selectedCompanyId = prefs.getString('selectedCompanyId');
      if (selectedCompanyId == null) {
        throw Exception('Company ID not found in SharedPreferences');
      }
      final response = _apiClient.request(
        'GET',
        '/product/products?company=$selectedCompanyId',
      );
      return response;
    } catch (e) {
      throw Exception('Failed to fetch products');
    }
  }
}
