import 'package:business_tracker/core/utils/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Attributetypedatasource {
  final ApiClient _apiClient = ApiClient();

  getAttributeTypes(int page) {
    try {
      final response = _apiClient.request(
        'GET',
        '/product/attribute-types/',
      );
      return response;
    } catch (e) {
      throw Exception('Failed to fetch attribute-types');
    }
  }

  Future<Map<String, dynamic>> addAttributeType(String typeName) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final selectedCompanyId = prefs.getString('selectedCompanyId');
      if (selectedCompanyId == null) {
        throw Exception('Company ID not found in SharedPreferences');
      }
      var jsonPayload = {"name": typeName, "company": selectedCompanyId};

      final response = await _apiClient.request(
        'POST',
        '/product/attribute-types/',
        body: jsonPayload,
      );
      return response;
    } catch (e) {
      throw Exception('Failed to add attribute type');
    }
  }
}
