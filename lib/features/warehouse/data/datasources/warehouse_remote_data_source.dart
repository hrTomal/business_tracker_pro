import 'dart:convert';
import 'package:business_tracker/core/utils/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WarehouseRemoteDataSource {
  final ApiClient _apiClient = ApiClient();

  Future<Map<String, dynamic>> getWarehouses(int page) async {
    try {
      final response = await _apiClient.request(
        'GET',
        '/warehouse/warehouses/',
        queryParams: {'page': page.toString()},
      );
      return response;
    } catch (e) {
      throw Exception('Failed to fetch warehouses');
    }
  }

  Future<Map<String, dynamic>> addWarehouse(
      Map<String, dynamic> warehouseData) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final selectedCompanyId = prefs.getString('selectedCompanyId');
      if (selectedCompanyId == null) {
        throw Exception('Company ID not found in SharedPreferences');
      }

      warehouseData['company'] = selectedCompanyId;
      final jsonData = jsonEncode(warehouseData);
      print(jsonData);
      final response = await _apiClient.request(
        'POST',
        '/warehouse/warehouses/',
        body: jsonData,
      );
      return response;
    } catch (e) {
      throw Exception('Failed to add warehouse');
    }
  }
}
