import 'dart:convert';

import 'package:business_tracker/core/storage/token_storage.dart';
import 'package:business_tracker/core/utils/constants.dart';
import 'package:http/http.dart' as http;

class CompanyRemoteDataSource {
  final TokenStorage _tokenStorage = TokenStorage();

  Future<void> createCompany(
      String companyName, String addressLine1, String addressLine2) async {
    final url = Uri.parse('${AppConstants.baseUrl}/company/companies/');
    final token = await _tokenStorage.getAccessToken();
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: json.encode({
        'name': companyName,
        'address_line_1': addressLine1,
        'address_line_2': addressLine2,
      }),
    );

    if (response.statusCode == 201) {
      // final responseData = json.decode(response.body);
      // final responseObj = Company.fromJson(responseData);
      print('Company Created');
    } else {
      // Handle error response
      throw Exception('Failed to register user');
    }
  }
}
