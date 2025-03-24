// lib/features/profile/controllers/profile_controller.dart
import 'package:evnt/main.dart';
import 'package:evnt/src/core/utils/method_channel_service.dart';
import 'package:evnt/src/features/auth/models/app_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'profile_controller.g.dart';

@riverpod
class ProfileController extends _$ProfileController {
  @override
  FutureOr<User?> build() async {
    return ref.watch(isarServiceProvider).getUser();
  }

  Future<void> updateName(String name) async {
    final user = state.valueOrNull;
    if (user != null) {
      user.name = name;
      await ref.read(isarServiceProvider).saveUser(user);
      state = AsyncValue.data(user);
    }
  }

  Future<void> updateProfilePicture() async {
    final user = state.valueOrNull;
    if (user == null) return;

    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    
    if (image != null) {
      user.profilePicture = image.path;
      await ref.read(isarServiceProvider).saveUser(user);
      state = AsyncValue.data(user);
    }
  }
}

@riverpod
Future<Map<String, dynamic>> deviceInfo(DeviceInfoRef ref) async {
  return ref.watch(methodChannelServiceProvider).getDeviceInfo();
}