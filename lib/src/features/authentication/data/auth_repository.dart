import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/api_constants.dart';
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
    _initialize();
  }

  final _authState = InMemoryStore<AppUser?>(null);
  Future<void> _initialize() async {
    final first = isFirstTime();
    if (first) {
      await secureStorage.delete(key: userKey);
    }
    final value = await secureStorage.read(key: userKey);
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
      throw Exception(
          response.data['data']['email']?.first ?? 'Something went wrong');
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
          name: 'name',
          email: email,
          phone: 'phone',
          token: response.data['token'] as String);
      await _saveUser(user);
      _authState.value = user;
    } else {
      throw Exception(response.data['message']);
    }
  }

  Future<void> signOut() async {
    await secureStorage.delete(key: userKey);
    _authState.value = null;
  }

  bool isFirstTime() {
    final isFirstTime = sharedPreferences.getBool('first_time');
    if (isFirstTime != null && !isFirstTime) {
      sharedPreferences.setBool('first_time', false);
      return false;
    } else {
      sharedPreferences.setBool('first_time', false);
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
