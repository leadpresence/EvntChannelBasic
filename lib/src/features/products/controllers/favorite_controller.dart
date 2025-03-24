
// lib/features/products/controllers/favorites_controller.dart
import 'package:evnt/src/features/products/models/product.dart';
import 'package:evnt/src/features/products/controllers/product_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/product.dart';
import '../repositories/product_repository.dart';

part 'favorite_controller.g.dart';

@riverpod
class FavoritesController extends _$FavoritesController {
  @override
  FutureOr<List<Product>> build() {
    return ref.watch(productRepositoryProvider).getFavoriteProducts();
  }

  Future<void> toggleFavorite(int id) async {
    await ref.read(productRepositoryProvider).toggleFavorite(id);
    ref.invalidateSelf();
    ref.invalidate(productControllerProvider);
    ref.invalidate(productDetailsProvider(id));
  }
}