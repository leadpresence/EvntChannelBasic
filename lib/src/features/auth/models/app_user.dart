// lib/features/auth/models/user.dart
import 'package:isar/isar.dart';

part 'app_user.g.dart';

@Collection()
class User {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String email;
  late String name;
  late String? profilePicture;
  late String hashedPassword; // Store hashed password only
  
  // Don't store auth token in Isar (use flutter_secure_storage)
}
