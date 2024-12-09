import 'package:business_tracker/core/utils/api_client.dart';

class CompanyRemoteDataSource {
  final ApiClient _apiClient = ApiClient();

  Future<Map<String, dynamic>> getCompany(int page) async {
    try {
      final response = await _apiClient.request(
        'GET',
        '/company/companies',
      );
      // print('Company details fetched: $response');
      return response; // Return the parsed response
    } catch (e) {
      // print('Error fetching company details: $e');
      throw Exception('Failed to fetch company details');
    }
  }

  Future<void> createCompany(
      String companyName, String addressLine1, String addressLine2) async {
    try {
      await _apiClient.request(
        'POST',
        '/company/companies/',
        body: {
          'name': companyName,
          'address_line_1': addressLine1,
          'address_line_2': addressLine2,
        },
      );
      // print('Company Created');
    } catch (e) {
      // print('Error creating company: $e');
      throw Exception('Failed to create company');
    }
  }
}
