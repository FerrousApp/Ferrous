import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class User {
  String? id;
  String? firstName;
  String? lastName;
  String? email;

  String? phone;
  String? dob;
  String? country;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.dob,
    this.phone,
    this.country,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      phone: json['phone_number'],
      dob: json['date_of_birth'],
      country: json["country_of_origin"],
    );
  }
}

class FerrousClient {
  // Singleton
  static final FerrousClient _instance = FerrousClient._internal();
  factory FerrousClient() => _instance;
  FerrousClient._internal() {
    _init();
  }

  // Secure Storage
  final _storage = const FlutterSecureStorage();

  // Dio client (single instance)
  late final Dio dio;

  // Stream for user updates
  final _userController = StreamController<User?>.broadcast();
  Stream<User?> get userStream => _userController.stream;

  User? _currentUser;
  String? _accessToken;
  String? _refreshToken;

  Future<void> _init() async {
    dio = Dio(
      BaseOptions(
        baseUrl:
            "https://api.ferrous.app/api", // <-- Replace with your base URL
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 15),
      ),
    );

    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );

    // Load stored tokens
    _accessToken = await _storage.read(key: 'accessToken');
    _refreshToken = await _storage.read(key: 'refreshToken');

    // Attach interceptor for auth
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (_accessToken != null) {
            options.headers['Authorization'] = 'Bearer $_accessToken';
          }
          return handler.next(options);
        },
        onError: (DioException e, handler) async {
          // Handle token refresh if 401
          if (e.response?.statusCode == 401 && _refreshToken != null) {
            final refreshed = await _refreshTokens();
            if (refreshed) {
              // retry request
              final req = e.requestOptions;
              req.headers['Authorization'] = 'Bearer $_accessToken';
              final cloneReq = await dio.fetch(req);
              return handler.resolve(cloneReq);
            }
          }
          return handler.next(e);
        },
      ),
    );

    // If token exists, try fetching current user
    if (_accessToken != null) {
      await fetchCurrentUser();
    }
  }

  Future<void> setTokens(String accessToken, String refreshToken) async {
    _accessToken = accessToken;
    _refreshToken = refreshToken;

    await _storage.write(key: 'accessToken', value: accessToken);
    await _storage.write(key: 'refreshToken', value: refreshToken);

    await fetchCurrentUser();
  }

  Future<bool> _refreshTokens() async {
    try {
      final response = await dio.post('/auth/refresh', data: {
        'refreshToken': _refreshToken,
      });
      final newAccessToken = response.data['accessToken'];
      final newRefreshToken = response.data['refreshToken'];

      if (newAccessToken != null && newRefreshToken != null) {
        await setTokens(newAccessToken, newRefreshToken);
        return true;
      }
      return false;
    } catch (_) {
      await clearSession();
      return false;
    }
  }

  Future<void> fetchCurrentUser() async {
    try {
      final response = await dio.get('/users/getuser');
      _currentUser = User.fromJson(response.data);
      _userController.add(_currentUser);
    } catch (_) {
      _currentUser = null;
      _userController.add(null);
    }
  }

  Future<void> clearSession() async {
    _currentUser = null;
    _accessToken = null;
    _refreshToken = null;
    await _storage.delete(key: 'accessToken');
    await _storage.delete(key: 'refreshToken');
    _userController.add(null);
  }

  User? get currentUser => _currentUser;
}
