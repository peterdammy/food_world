import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_world/model/recent_order_model.dart';

final List<RecentOrderModel> recentOrderModel = [
  RecentOrderModel(
    orderId: '1618H0',
    amount: 252.52,
    payDate: 'July 11, 2022',
    isCompleted: false,
  ),

  RecentOrderModel(
    orderId: '1238JK',
    amount: 20.00,
    payDate: 'July 1, 2022',
    isCompleted: true,
  ),

  RecentOrderModel(
    orderId: '3100  HG',
    amount: 152.23,
    payDate: 'June 20, 2022',
    isCompleted: true,
  ),

  RecentOrderModel(
    orderId: '1425SA',
    amount: 100.79,
    payDate: 'may 30, 2022',
    isCompleted: true,
  ),
];

final recentOrderProvider = Provider((ref) {
  return recentOrderModel;
});
