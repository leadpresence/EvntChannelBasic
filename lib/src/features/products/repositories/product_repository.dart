

// lib/features/products/repositories/product_repository.dart
import 'package:evnt/main.dart';
import 'package:evnt/src/features/products/models/product.dart';
import 'package:evnt/src/features/products/models/product_dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/api/api_client.dart';
import '../../../core/local_storage/isar_service.dart';

part 'product_repository.g.dart';

class ProductRepository {
  final ApiClient _apiClient;
  final IsarService _isarService;

  ProductRepository(this._apiClient, this._isarService);

  Future<List<Product>> getProducts() async {
    try {
      // Check local storage first
      final localProducts = await _isarService.getAllProducts();
      if (localProducts.isNotEmpty) {
        return localProducts;
      }

      // Fetch from API if local storage is empty
      final productsData = await _apiClient.getProducts();
      final productsDto = productsData
          .map((json) => ProductDto.fromJson(json as Map<String, dynamic>))
          .toList();
      
      // Save to local storage
      await _isarService.saveProducts(productsDto.map((e) => e.toProduct()).toList());
      return productsDto.map((e) => e.toProduct()).toList();
    } catch (e) {
      return [];
    }
  }

  Future<Product?> getProductDetails(int id) async {
    try {
      // Check local storage first
      final localProduct = await _isarService.getProductById(id);
      if (localProduct != null) {
        return localProduct;
      }

      // Fetch from API if not in local storage
      final productData = await _apiClient.getProductDetails(id);
      final productdto = ProductDto.fromJson(productData);
      
      // Save to local storage
      await _isarService.saveProduct(productdto.toProduct());
      return productdto.toProduct();
    } catch (e) {
      return null;
    }
  }

  Future<List<Product>> getFavoriteProducts() async {
    return _isarService.getFavoriteProducts();
  }

  Future<void> toggleFavorite(int id) async {
    await _isarService.toggleFavorite(id);
  }
}

@riverpod
ProductRepository productRepository(ProductRepositoryRef ref) {
  return ProductRepository(
    ref.watch(apiClientProvider),
    ref.watch(isarServiceProvider),
  );
}
