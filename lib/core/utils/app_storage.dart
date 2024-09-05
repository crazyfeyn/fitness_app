import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppSecureStorage {
  AppSecureStorage() : _storage = const FlutterSecureStorage();

  static const _accessKey = 'access_token';

  final FlutterSecureStorage _storage;

  Future<void> setAccessToken(String token) async {
    await _storage.write(key: _accessKey, value: token);
  }

  Future<String?> getAccessToken() async {
    return _storage.read(key: _accessKey);
  }

  Future<void> clean() async {
    await _storage.deleteAll();
  }
}