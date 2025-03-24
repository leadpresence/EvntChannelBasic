import 'package:evnt/src/features/auth/models/app_user.dart';
import 'package:evnt/src/features/products/models/product.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
 
class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();
    return Isar.open(
      [UserSchema, ProductSchema],
      directory: dir.path,
    );
  }

  // User methods
  Future<void> saveUser(User user) async {
    final isar = await db;
    isar.writeTxn(() => isar.users.put(user));
  }

  Future<User?> getUser() async {
    final isar = await db;
    return isar.users.where().findFirst();
  }

  Future<void> deleteUser() async {
    final isar = await db;
    await isar.writeTxn(() => isar.users.clear());
  }

  // Product methods
  Future<void> saveProduct(Product product) async {
    final isar = await db;
    isar.writeTxn(() => isar.products.put(product));
  }

  Future<void> saveProducts(List<Product> products) async {
    final isar = await db;
    isar.writeTxn(() => isar.products.putAll(products));
  }

  Future<List<Product>> getAllProducts() async {
    final isar = await db;
    return isar.products.where().findAll();
  }

  Future<Product?> getProductById(int id) async {
    final isar = await db;
    return isar.products.where().idEqualTo(id).findFirst();
  }

  Future<List<Product>> getFavoriteProducts() async {
    final isar = await db;
    return isar.products.filter().isFavoriteEqualTo(true).findAll();
  }

  Future<void> toggleFavorite(int id) async {
    final isar = await db;
    await isar.writeTxn(() async {
      final product = await isar.products.get(id);
      if (product != null) {
        product.isFavorite = !product.isFavorite;
        await isar.products.put(product);
      }
    });
  }
}