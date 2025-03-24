// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productDetailsHash() => r'fea9b1eb4006d6cc64aa9c04eb56658192becd3d';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [productDetails].
@ProviderFor(productDetails)
const productDetailsProvider = ProductDetailsFamily();

/// See also [productDetails].
class ProductDetailsFamily extends Family<AsyncValue<Product?>> {
  /// See also [productDetails].
  const ProductDetailsFamily();

  /// See also [productDetails].
  ProductDetailsProvider call(
    int id,
  ) {
    return ProductDetailsProvider(
      id,
    );
  }

  @override
  ProductDetailsProvider getProviderOverride(
    covariant ProductDetailsProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'productDetailsProvider';
}

/// See also [productDetails].
class ProductDetailsProvider extends AutoDisposeFutureProvider<Product?> {
  /// See also [productDetails].
  ProductDetailsProvider(
    int id,
  ) : this._internal(
          (ref) => productDetails(
            ref as ProductDetailsRef,
            id,
          ),
          from: productDetailsProvider,
          name: r'productDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$productDetailsHash,
          dependencies: ProductDetailsFamily._dependencies,
          allTransitiveDependencies:
              ProductDetailsFamily._allTransitiveDependencies,
          id: id,
        );

  ProductDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<Product?> Function(ProductDetailsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProductDetailsProvider._internal(
        (ref) => create(ref as ProductDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Product?> createElement() {
    return _ProductDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductDetailsProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ProductDetailsRef on AutoDisposeFutureProviderRef<Product?> {
  /// The parameter `id` of this provider.
  int get id;
}

class _ProductDetailsProviderElement
    extends AutoDisposeFutureProviderElement<Product?> with ProductDetailsRef {
  _ProductDetailsProviderElement(super.provider);

  @override
  int get id => (origin as ProductDetailsProvider).id;
}

String _$productControllerHash() => r'fc5c7ccc94ce9de0296da6a936e677f296c1b683';

/// See also [ProductController].
@ProviderFor(ProductController)
final productControllerProvider =
    AutoDisposeAsyncNotifierProvider<ProductController, List<Product>>.internal(
  ProductController.new,
  name: r'productControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$productControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProductController = AutoDisposeAsyncNotifier<List<Product>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
