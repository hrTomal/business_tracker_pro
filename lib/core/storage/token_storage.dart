import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _tokenExpirationKey = 'token_expiration';

  // Save tokens to secure storage
  Future<void> saveTokens(String accessToken, String refreshToken) async {
    final expirationDate =
        DateTime.now().add(const Duration(days: 7)).toIso8601String();

    await _secureStorage.write(key: _accessTokenKey, value: accessToken);
    await _secureStorage.write(key: _refreshTokenKey, value: refreshToken);
    await _secureStorage.write(key: _tokenExpirationKey, value: expirationDate);
  }

  // Get access token from storage
  Future<String?> getAccessToken() async {
    final expirationDateStr =
        await _secureStorage.read(key: _tokenExpirationKey);
    if (expirationDateStr != null) {
      final expirationDate = DateTime.parse(expirationDateStr);
      if (DateTime.now().isBefore(expirationDate)) {
        return await _secureStorage.read(key: _accessTokenKey);
      } else {
        await clearTokens();
        return null; // Token expired
      }
    }
    return null;
  }

  // Get refresh token from storage
  Future<String?> getRefreshToken() async {
    return await _secureStorage.read(key: _refreshTokenKey);
  }

  // Clear all tokens
  Future<void> clearTokens() async {
    await _secureStorage.deleteAll();
  }

  // Check if the token has expired
  Future<bool> isTokenValid() async {
    final expirationDateStr =
        await _secureStorage.read(key: _tokenExpirationKey);
    if (expirationDateStr != null) {
      final expirationDate = DateTime.parse(expirationDateStr);
      return DateTime.now().isBefore(expirationDate);
    }
    return false;
  }
}
