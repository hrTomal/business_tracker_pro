import 'dart:convert';
import 'package:business_tracker/core/storage/token_storage.dart';
import 'package:business_tracker/core/utils/constants.dart';
import 'package:business_tracker/features/auth/data/models/auth_response.dart';
import 'package:business_tracker/features/auth/data/models/register_response.dart';
import 'package:http/http.dart' as http;

class AuthenticationRemoteDataSource {
  final TokenStorage _tokenStorage = TokenStorage();

  Future<void> registerUser(String email, String password, String firstName,
      String lastName, String userName) async {
    final url = Uri.parse('${AppConstants.baseUrl}/user/users/register/');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'username': userName,
        'email': email,
        'password': password,
        'password2': password,
        'first_name': firstName,
        'last_name': lastName,
      }),
    );

    if (response.statusCode == 201) {
      final responseData = json.decode(response.body);
      final responseObj = RegisterResponse.fromJson(responseData);
      await _tokenStorage.saveTokens(
          responseObj.access ?? '', responseObj.refresh ?? '');
    } else {
      // Handle error response
      throw Exception('Failed to register user');
    }
  }

  Future<void> loginUser(String userIdentifier, String password) async {
    final url = Uri.parse('${AppConstants.baseUrl}/user/auth/token/jwt/');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(
        {
          'username': userIdentifier,
          'password': password,
        },
      ),
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final responseObj = AuthResponse.fromJson(responseData);
      await _tokenStorage.saveTokens(
        responseObj.access ?? '',
        responseObj.refresh ?? '',
      );
    } else {
      // Handle error response
      throw Exception('Failed to Login');
    }
  }
}
