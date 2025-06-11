import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_world/model/personal_info_model.dart';
import 'package:food_world/provider/auth_provider.dart';
import 'package:food_world/provider/auth_user_provider.dart';

final currentUserProvider = FutureProvider<PersonalInfoModel>((ref) async {
  final user = ref.watch(authUserProvider).asData?.value;

  if (user == null) throw Exception('No authenticated user');

  final authService = ref.read(authServiceProvider);
  final personalInfo = await authService.fetchUserDataFromFireStore();

  return personalInfo;
});
