import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/api_constants.dart';
import '../../../exception/app_exception.dart';
import '../../../utils/dio_provider.dart';
import '../../../utils/in_memory_store.dart';
import '../../../utils/shared_preference_provider.dart';
import '../domain/app_user.dart';
part 'auth_repository.g.dart';

class AuthRepository {
  final FlutterSecureStorage secureStorage;
  final SharedPreferences sharedPreferences;
  final Dio client;
  AuthRepository(
      {required this.secureStorage,
      required this.client,
      required this.sharedPreferences}) {
    // _initialize();
  }

  static final _authState = InMemoryStore<AppUser?>(null);
  static Future<void> initialize() async {
    const secure = FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ),
    );

    final first = await _isFirstTime();
    if (first) {
      await secure.deleteAll();
    }
    final value = await secure.read(key: userKey);
    final AppUser? user = value == null ? null : AppUser.fromJson(value);
    _authState.value = user;
  }

  Stream<AppUser?> authStateChanges() => _authState.stream;
  AppUser? get currentUser => _authState.value;

  Future<void> registerWithEmailPassword(
      String name,
      String email,
      String phone,
      String password,
      String confirmPassword,
      CancelToken? cancelToken) async {
    final uri = Uri(
      scheme: 'https',
      host: baseUrl,
      path: register,
    );
    final response = await client.post(
      uri.toString(),
      cancelToken: cancelToken,
      options: Options(
        headers: {'Accept': 'application/json'},
      ),
      data: {
        'name': name,
        'email': email,
        'phone': phone,
        'password': password,
        'password_confirmation': confirmPassword,
      },
    );
    if (response.data['status'] as int == 200) {
      final user = AppUser(
          name: name,
          email: email,
          phone: phone,
          token: response.data['token'] as String);
      await _saveUser(user);
      _authState.value = user;
    } else {
      throw RegistrationException(
          response.data['data']['email']?.first.toString() ??
              'Something went wrong');
    }
  }

  Future<void> loginWithEmailAndPassword(
      String email, String password, CancelToken? cancelToken) async {
    final uri = Uri(
      scheme: 'https',
      host: baseUrl,
      path: login,
    );
    final response = await client.post(
      uri.toString(),
      cancelToken: cancelToken,
      options: Options(
        headers: {'Accept': 'application/json'},
      ),
      data: {
        'email': email,
        'password': password,
      },
    );
    if (response.data['status'] == null) {
      final user = AppUser(
          name: response.data['user']['name'] as String,
          email: email,
          phone: response.data['user']['phone'] as String,
          token: response.data['token'] as String);
      await _saveUser(user);
      _authState.value = user;
    } else {
      throw LoginException(response.data['message'] as String);
    }
  }

  Future<void> sendOtp(String email) async {
    final uri = Uri(
      scheme: 'https',
      host: baseUrl,
      path: forgotPassword,
    );
    final response = await client.postUri(
      uri,
      options: Options(
        headers: {'Accept': 'application/json'},
      ),
      data: {
        'email': email,
      },
    );
    if (response.data['success'] != 200) {
      throw CodeNotSentException();
    }
  }

  Future<void> forgotPasswordReset(
    String email,
    String code,
    String password,
  ) async {
    final uri = Uri(
      scheme: 'https',
      host: baseUrl,
      path: resetPassword,
    );
    final response = await client.postUri(
      uri,
      options: Options(
        headers: {'Accept': 'application/json'},
      ),
      data: {
        'email': email,
        'code': code,
        'password': password,
      },
    );

    if (response.data['success'] != 200) {
      throw ResetPasswordException();
    }
  }

  Future<void> signOut() async {
    await secureStorage.delete(key: userKey);
    _authState.value = null;
  }

  static Future<bool> _isFirstTime() async {
    final shared = await SharedPreferences.getInstance();
    final isFirstTime = shared.getBool('first_time');
    if (isFirstTime != null && !isFirstTime) {
      await shared.setBool('first_time', false);
      return false;
    } else {
      await shared.setBool('first_time', false);
      return true;
    }
  }

  void dispose() => _authState.close();
  Future<void> _saveUser(AppUser user) {
    return secureStorage.write(key: userKey, value: user.toJson());
  }
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(AuthRepositoryRef ref) {
  final dio = ref.read(dioProvider);
  final secureStorage = ref.read(secureStorageProvider);
  final sharedPreferences = ref.read(sharedPreferencesProvider);
  final auth = AuthRepository(
      secureStorage: secureStorage,
      client: dio,
      sharedPreferences: sharedPreferences);
  ref.onDispose(auth.dispose);
  return auth;
}

@riverpod
FlutterSecureStorage secureStorage(SecureStorageRef ref) =>
    const FlutterSecureStorage();

@Riverpod(keepAlive: true)
Stream<AppUser?> authStateChanges(AuthStateChangesRef ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.authStateChanges();
}
