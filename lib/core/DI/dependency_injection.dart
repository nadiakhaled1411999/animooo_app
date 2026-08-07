import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'package:animooo_app/core/constants/api_constants.dart';
import 'package:animooo_app/core/helpers/secure_storage_helper.dart';
import 'package:animooo_app/core/networking/dio_interceptor.dart';

final getIt = GetIt.instance;

Future<void> setupDependencyInjection() async {
  // ── Secure Storage ────────────────────────────────────────
  getIt.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(),
  );
  getIt.registerLazySingleton<SecureStorageHelper>(
    () => SecureStorageHelper(getIt<FlutterSecureStorage>()),
  );

  // ── Dio ───────────────────────────────────────────────────
  final dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      headers: {'Content-Type': 'application/json'},
    ),
  );

  getIt.registerLazySingleton<Dio>(() => dio);

  // ── Logger ────────────────────────────────────────────────
  dio.interceptors.add(
    PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
      enabled: kDebugMode,
    ),
  );

  // ── Interceptor ───────────────────────────────────────────
  dio.interceptors.add(AuthInterceptor(getIt<SecureStorageHelper>()));

  // TODO: register feature-level dependencies here (data sources,
  // repositories, use cases, cubits/blocs) as features are built.
}
