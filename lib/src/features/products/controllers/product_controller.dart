
// lib/features/products/controllers/product_controller.dart
import 'package:evnt/src/features/products/models/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/product.dart';
import '../repositories/product_repository.dart';

part 'product_controller.g.dart';

@riverpod
class ProductController extends _$ProductController {
  @override
  FutureOr<List<Product>> build() {
    return ref.watch(productRepositoryProvider).getProducts();
  }

  Future<void> refreshProducts() async {
    state = const AsyncValue.loading();
    state = AsyncValue.data(await ref.read(productRepositoryProvider).getProducts());
  }
}

@riverpod
Future<Product?> productDetails(ProductDetailsRef ref, int id) {
  return ref.watch(productRepositoryProvider).getProductDetails(id);
}
