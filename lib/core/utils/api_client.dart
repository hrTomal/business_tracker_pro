import 'dart:convert';
import 'package:business_tracker/core/storage/token_storage.dart';
import 'package:business_tracker/core/utils/constants.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  final TokenStorage _tokenStorage = TokenStorage();

  Future<http.Response> _sendRequest(
    String method,
    String endpoint, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
    dynamic body,
    bool isFormData = false,
  }) async {
    final url = Uri.parse('${AppConstants.baseUrl}$endpoint')
        .replace(queryParameters: queryParams);
    final token = await _tokenStorage.getAccessToken();

    headers ??= {};
    headers.addAll({
      'Authorization': 'Bearer $token',
    });

    if (!isFormData) {
      headers['Content-Type'] = 'application/json';
    }

    if (isFormData && body is Map<String, dynamic>) {
      final request = http.MultipartRequest(method.toUpperCase(), url);
      request.headers.addAll(headers);

      body.forEach((key, value) {
        if (value is String || value is int) {
          request.fields[key] = value.toString();
        } else if (value is http.MultipartFile) {
          request.files.add(value);
        }
      });

      final streamedResponse = await request.send();
      return await http.Response.fromStream(streamedResponse);
    }

    switch (method.toUpperCase()) {
      case 'GET':
        return await http.get(url, headers: headers);
      case 'POST':
        return isFormData
            ? throw Exception('Use form-data flag for Multipart requests')
            : await http.post(url, headers: headers, body: json.encode(body));
      case 'PUT':
        return await http.put(url, headers: headers, body: json.encode(body));
      case 'PATCH':
        return await http.patch(url, headers: headers, body: json.encode(body));
      case 'DELETE':
        return await http.delete(url, headers: headers);
      default:
        throw Exception('HTTP method $method is not supported');
    }
  }

  Future<dynamic> request(
    String method,
    String endpoint, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
    dynamic body,
    bool isFormData = false,
  }) async {
    final response = await _sendRequest(
      method,
      endpoint,
      headers: headers,
      queryParams: queryParams,
      body: body,
      isFormData: isFormData,
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response.body.isNotEmpty ? json.decode(response.body) : null;
    } else {
      final errorMessage = response.body.isNotEmpty
          ? json.decode(response.body)['error'] ?? 'Something went wrong'
          : 'Failed to process request';
      throw Exception('Error ${response.statusCode}: $errorMessage');
    }
  }

  Future<http.MultipartFile> createMultipartFile(
    String fieldName,
    String filePath,
    String fileName,
  ) async {
    return await http.MultipartFile.fromPath(fieldName, filePath,
        filename: fileName);
  }
}
