
// lib/features/auth/controllers/auth_controller.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../repositories/auth_repository.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  FutureOr<bool> build() async {
    return ref.watch(authRepositoryProvider).isLoggedIn();
  }

  Future<bool> login(String email, String password) async {
    state = const AsyncValue.loading();
    final success = await ref.read(authRepositoryProvider).login(email, password);
    state = AsyncValue.data(success);
    return success;
  }

  Future<bool> register(String name, String email, String password) async {
    state = const AsyncValue.loading();
    final success = await ref.read(authRepositoryProvider).register(name, email, password);
    state = AsyncValue.data(success);
    return success;
  }

  Future<void> logout() async {
    state = const AsyncValue.loading();
    await ref.read(authRepositoryProvider).logout();
    state = const AsyncValue.data(false);
  }
}