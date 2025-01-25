import 'package:business_tracker/core/utils/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AttributeRemoteDataSource {
  final ApiClient _apiClient = ApiClient();

  getAttributes(int page) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final selectedCompanyId = prefs.getString('selectedCompanyId');
      if (selectedCompanyId == null) {
        throw Exception('Company ID not found in SharedPreferences');
      }
      final response = _apiClient.request(
        'GET',
        '/product/attributes/',
      );
      return response;
    } catch (e) {
      throw Exception('Failed to fetch attributes');
    }
  }

  Future<Map<String, dynamic>> addAttribute(
      String attibuteName, String attributeType) async {
    try {
      // final prefs = await SharedPreferences.getInstance();
      // final selectedCompanyId = prefs.getString('selectedCompanyId');
      // if (selectedCompanyId == null) {
      //   throw Exception('Company ID not found in SharedPreferences');
      // }
      var jsonPayload = {
        "name": attibuteName,
        "attribute_type": attributeType,
      };

      final response = await _apiClient.request(
        'POST',
        '/product/attributes/',
        body: jsonPayload,
      );
      return response;
    } catch (e) {
      throw Exception('Failed to add attribute type');
    }
  }
}
