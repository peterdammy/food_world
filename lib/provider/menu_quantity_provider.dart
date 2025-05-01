import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuantityNotifier extends StateNotifier<Map<String, int>> {
  QuantityNotifier() : super({});

  void increment(String id) {
    state = {...state, id: (state[id] ?? 0) + 1};
  }

  void decrement(String id) {
    final current = state[id] ?? 0;
    if (current > 0) {
      state = {...state, id: current - 1};
    }
  }
}

final quantityProvider =
    StateNotifierProvider<QuantityNotifier, Map<String, int>>((ref) {
      return QuantityNotifier();
    });
