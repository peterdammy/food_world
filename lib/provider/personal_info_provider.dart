import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_world/model/personal_info_model.dart';
import 'package:food_world/provider/auth_provider.dart';

final personalInfoProvider = FutureProvider<PersonalInfoModel>((ref) async {
  final PersonalInfoModel personalInfoModel =
      await ref.watch(authServiceProvider).fetchUserDataFromFireStore();
  return personalInfoModel;
});
