import 'package:business_tracker/core/utils/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VendorDataSource {
  final ApiClient _apiClient = ApiClient();

  Future<Map<String, dynamic>> getVendors(int page) async {
    try {
      final response = await _apiClient.request(
        'GET',
        '/purchase/vendors/',
        queryParams: {'page': page.toString()},
      );
      return response;
    } catch (e) {
      throw Exception('Failed to fetch vendors');
    }
  }

  Future<Map<String, dynamic>> addVendor(String vendorName, String vendorEmail,
      String phone, String website) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final selectedCompanyId = prefs.getString('selectedCompanyId');
      if (selectedCompanyId == null) {
        throw Exception('Company ID not found in SharedPreferences');
      }
      var jsonPayload = {
        "name": vendorName,
        "email": vendorEmail,
        "company": selectedCompanyId,
        "phone": phone,
        "website": website
      };

      final response = await _apiClient.request(
        'POST',
        '/purchase/vendors/',
        body: jsonPayload,
      );
      return response;
    } catch (e) {
      throw Exception('Failed to add vendor');
    }
  }
}
