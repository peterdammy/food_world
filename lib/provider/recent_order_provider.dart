import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_world/model/recent_order_model.dart';

class RecentOrderNotifier extends StateNotifier<List<RecentOrderModel>> {
  RecentOrderNotifier(this.uid) : super([]) {
    loadRecentOrdersFromFirebase(uid);
  }

  final String uid;
  final _firestore = FirebaseFirestore.instance;

  Future<void> addRecentOrder(RecentOrderModel order) async {
    state = [...state, order];
    await _firestore.collection('recent_orders').add({
      'orderId': order.orderId,
      'amount': order.amount,
      'payDate': order.payDate,
      'isCompleted': order.isCompleted,
      'uid': uid,
    });
  }

  Future<void> loadRecentOrdersFromFirebase(String uid) async {
    final snapshot =
        await _firestore
            .collection('recent_orders')
            .where('uid', isEqualTo: uid)
            .get();

    final orders =
        snapshot.docs.map((doc) {
          final data = doc.data();
          return RecentOrderModel(
            orderId: data['orderId'],
            amount: (data['amount'] as num).toDouble(),
            payDate: data['payDate'],
            isCompleted: data['isCompleted'] ?? true,
          );
        }).toList();

    state = orders;
  }

  void deleteRecentOrder(String orderId) {
    state = [
      for (final order in state)
        if (order.orderId != orderId) order,
    ];
  }
}
