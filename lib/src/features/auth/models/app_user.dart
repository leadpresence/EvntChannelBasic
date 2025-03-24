// lib/features/auth/models/user.dart
import 'package:isar/isar.dart';

part 'app_user.g.dart';

@Collection()
class User {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String email;
  late String name;
  String? profilePicture ="https://www.londondentalsmiles.co.uk/wp-content/uploads/2017/06/person-dummy.jpg";
  late String hashedPassword; // Store hashed password only
  
  // Don't store auth token in Isar (use flutter_secure_storage)
}
