import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/features/auth/presentation/manager/user_id_provider.dart';
import 'package:smart_university_app/features/profile/data/models/user_model.dart';
import 'package:smart_university_app/features/profile/data/services/user_service.dart';

final userServiceProvider = Provider((ref) => UserService());

final currentUserProvider = FutureProvider<UserModel?>((ref) async {
  final userId = ref.watch(userIdProvider);

  if (userId == null) return null;

  final service = ref.read(userServiceProvider);

  return service.getUserById(userId);
});
