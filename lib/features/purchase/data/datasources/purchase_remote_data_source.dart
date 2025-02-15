import 'dart:convert';

import 'package:business_tracker/core/utils/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PurchaseRemoteDataSource {
  final ApiClient _apiClient = ApiClient();

  Future<Map<String, dynamic>> getPurchases(int page) async {
    try {
      final response = await _apiClient.request(
        'GET',
        '/purchase/purchases/',
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

      purchaseData['company'] = selectedCompanyId;
      final jsonData = jsonEncode(purchaseData);
      print(jsonData);
      final response = await _apiClient.request(
        'POST',
        '/purchase/purchase-orders/',
        body: jsonData,
      );
      return response;
    } catch (e) {
      throw Exception('Failed to add purchase');
    }
  }
}
