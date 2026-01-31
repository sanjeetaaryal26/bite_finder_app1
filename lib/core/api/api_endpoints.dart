import 'package:flutter/foundation.dart';

class ApiEndpoints {
  ApiEndpoints._();

  static String get baseUrl {
    // Web can use localhost
    if (kIsWeb) {
      return 'http://localhost:5050/api';
    }

    // Use Android emulator host mapping
    if (defaultTargetPlatform == TargetPlatform.android) {
      return 'http://10.0.2.2:5050/api';
    }

    return 'http://localhost:5050/api';
  }

  static const Duration connectionTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);

  // ============ Endpoints ============

  //auth endpoints
  static const String auth = '/auth';
  static const String register = '/auth/register';
  static const String login = '/auth/login';
  static const String whoAmI = '/auth/whoami';
}
