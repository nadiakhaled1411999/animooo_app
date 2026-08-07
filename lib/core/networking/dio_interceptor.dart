import 'package:dio/dio.dart';

import 'package:animooo_app/core/helpers/secure_storage_helper.dart';

/// Adds the stored access token to every request when available.
///
/// TODO: extend this with token refresh / forced logout once the
/// app has authentication.
class AuthInterceptor extends Interceptor {
  final SecureStorageHelper _secureStorage;

  AuthInterceptor(this._secureStorage);

  // ── onRequest ─────────────────────────────────────────────
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final accessToken = await _secureStorage.getAccessToken();

    if (accessToken != null && accessToken.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    handler.next(options);
  }
}
