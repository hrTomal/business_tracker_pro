import 'package:business_tracker/core/utils/api_client.dart';
import 'package:business_tracker/features/categories/domain/entities/CategoryResponse.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoryRemoteSource {
  final ApiClient _apiClient = ApiClient();

  Future<CategoryResponse> fetchCategories() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final selectedCompanyId = prefs.getString('selectedCompanyId');
      if (selectedCompanyId == null) {
        throw Exception('User ID not found in SharedPreferences');
      }
      final url = '/product/categories?company=$selectedCompanyId';
      final response = await _apiClient.request('GET', url);

      return CategoryResponse.fromJson(response);
    } catch (e) {
      // Throw detailed exception for easier debugging
      throw Exception('Failed to fetch categories: ${e.toString()}');
    }
  }

  Future<void> addCategory(Map<String, String> formData) async {
    try {
      await _apiClient.request(
        'POST',
        '/product/categories/',
        body: formData,
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      );
    } catch (e) {
      throw Exception('Failed to add category: ${e.toString()}');
    }
  }
}
