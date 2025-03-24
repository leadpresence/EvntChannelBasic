// lib/features/auth/repositories/auth_repository.dart
import 'package:evnt/main.dart';
import 'package:evnt/src/core/local_storage/isar_service.dart';
import 'package:evnt/src/features/auth/models/app_user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

part 'auth_repository.g.dart';

class AuthRepository {
  final IsarService _isarService;
  final FlutterSecureStorage _secureStorage;

  AuthRepository(this._isarService, this._secureStorage);

  // Hash password for storage
  String _hashPassword(String password) {
    var bytes = utf8.encode(password);
    var digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<bool> register(String name, String email, String password) async {
    try {
      final user = User()
        ..name = name
        ..email = email
        ..hashedPassword = _hashPassword(password);
      
      await _isarService.saveUser(user);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> login(String email, String password) async {
    try {
      final user = await _isarService.getUser();
      if (user != null && 
          user.email == email && 
          user.hashedPassword == _hashPassword(password)) {
        
        // Generate and store auth token (in real app, would come from server)
        final token = 'demo_token_${DateTime.now().millisecondsSinceEpoch}';
        await _secureStorage.write(key: 'auth_token', value: token);
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> isLoggedIn() async {
    final token = await _secureStorage.read(key: 'auth_token');
    return token != null;
  }

  Future<void> logout() async {
    await _secureStorage.delete(key: 'auth_token');
  }
}

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepository(
    ref.watch(isarServiceProvider), 
    const FlutterSecureStorage(),
  );
}
