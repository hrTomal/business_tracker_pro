import 'package:business_tracker/core/utils/api_client.dart';

class Brandremotedatasource {
  final ApiClient _apiClient = ApiClient();

  getBrands(int page) {
    try {
      final response = _apiClient.request(
        'GET',
        '/product/brands',
      );
      return response;
    } catch (e) {
      throw Exception('Failed to fetch brand details');
    }
  }
}
