import 'package:business_tracker/core/utils/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PurchaseRemoteDataSource {
  final ApiClient _apiClient = ApiClient();

  Future<Map<String, dynamic>> getPurchases(int page) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final selectedCompanyId = prefs.getString('selectedCompanyId');
      if (selectedCompanyId == null) {
        throw Exception('Company ID not found in SharedPreferences');
      }
      final response = await _apiClient.request(
        'GET',
        '/purchase/purchase-orders?companies=$selectedCompanyId',
        queryParams: {'page': page.toString()},
      );
      return response;
    } catch (e) {
      throw Exception('Failed to fetch purchases');
    }
  }

  Future<Map<String, dynamic>> addPurchase(
      Map<String, dynamic> purchaseData) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final selectedCompanyId = prefs.getString('selectedCompanyId');
      if (selectedCompanyId == null) {
        throw Exception('Company ID not found in SharedPreferences');
      }

      purchaseData['company'] = int.parse(selectedCompanyId);

      final response = await _apiClient.request(
        'POST',
        '/purchase/purchase-orders/',
        body: purchaseData, // Pass the raw map, NOT jsonEncode(purchaseData)
      );

      return response;
    } catch (ex) {
      throw Exception('Failed to add purchase: ${ex.toString()}');
    }
  }
}
