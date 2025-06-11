import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_world/model/recent_order_model.dart';
import 'package:food_world/provider/recent_order_provider.dart';

final recentOrderProvider = StateNotifierProvider.family<
  RecentOrderNotifier,
  List<RecentOrderModel>,
  String
>((ref, uid) {
  return RecentOrderNotifier(uid);
});
