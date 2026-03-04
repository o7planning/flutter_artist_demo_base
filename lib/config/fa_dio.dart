import 'package:dio/dio.dart';
import 'package:flutter_artist_demo_mock_api/flutter_artist_demo_mock_api.dart';
import 'package:flutter_artist_dio/flutter_artist_dio.dart';
import 'package:fresh_dio/fresh_dio.dart';

import '../config/rest_config.dart';
import '../model/model.dart';
import 'token_storage_impl.dart';

//
// IMPORTANT: Using FlutterArtistDio Demo Mock Backend Server (Embedded)
//
const bool useFlutterArtistDemoMockBackend = false;

// Create FlutterArtistDio to use in this Application.
final flutterArtistDio = _createFlutterArtistDio(
  useFlutterArtistDemoMockBackend: useFlutterArtistDemoMockBackend,
);

// For Download.
final flutterArtistDio4Download = _createFlutterArtistDio(
  useFlutterArtistDemoMockBackend: useFlutterArtistDemoMockBackend,
  bytesResponse: true,
);

// *****************************************************************************

//
// (Optional, using [fresh_dio] package)
// This package help you add [Authorization] to headers and refresh if it expires.
// Note: LoggedInUserData implements OAuth2Token (fresh_dio package).
//
final fresh = Fresh.oAuth2<LoggedInUserData>(
  tokenStorage: TokenStorageImpl(),
  tokenHeader: (LoggedInUserData token) {
    return {"Authorization": "Bearer ${token.accessToken}"};
  },
  refreshToken: (LoggedInUserData? token, Dio client) {
    // Perform refresh and return new token
    throw UnimplementedError('Refresh token not supported!');
  },
);

// *****************************************************************************

FlutterArtistDio _createFlutterArtistDio({
  required bool useFlutterArtistDemoMockBackend,
  bool bytesResponse = false, // See Demo: [17a].
}) {
  // Create Dio object with BaseOptions.
  final Dio _dio = bytesResponse
      ? Dio(BaseOptions(baseUrl: appBaseURL, responseType: ResponseType.bytes))
      : Dio(BaseOptions(baseUrl: appBaseURL));

  // Optional.
  // This interceptor help you add [Authorization] to headers and refresh if it expires.
  _dio.interceptors.add(fresh);

  // Logger Interceptor (Optional)
  final loggerInterceptor = FlutterArtistDioLoggerInterceptor();
  _dio.interceptors.add(loggerInterceptor);

  // Use Mock Backend Server. (Package flutter_artist_demo_mock_backend)
  if (useFlutterArtistDemoMockBackend) {
    var mockBackendInterceptor = getFlutterArtistDemoMockInterceptor();
    _dio.interceptors.add(mockBackendInterceptor);
  }

  return FlutterArtistDio(dio: _dio);
}

// *****************************************************************************
