import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_world/model/menu_item_model.dart';

class MenuNotifier extends StateNotifier<List<MenuItemModel>> {
  MenuNotifier()
    : super([
        MenuItemModel(name: "Item1", price: 20.00),
        MenuItemModel(name: "Item2", price: 15.00),
        MenuItemModel(name: "Item3", price: 90.00),
        MenuItemModel(name: "Item4", price: 10.00),
        MenuItemModel(name: "Item5", price: 45.00),
      ]);

  void increaseQuantity(int index) {
    final updated = [...state];
    updated[index] = updated[index].copyWith(
      quantity: updated[index].quantity + 1,
    );
    state = updated;
  }

  void decreaseQuantity(int index) {
    final updated = [...state];
    if (updated[index].quantity > 1) {
      updated[index] = updated[index].copyWith(
        quantity: updated[index].quantity - 1,
      );
      state = updated;
    }
  }

  void toggleAddToCart(int index) {
    final updated = [...state];
    updated[index] = updated[index].copyWith(isAdded: !updated[index].isAdded);
    state = updated;
  }

  void clearCart() {
    state = [
      for (final item in state) item.copyWith(isAdded: false, quantity: 0),
    ];
  }
}

final menuProvider = StateNotifierProvider<MenuNotifier, List<MenuItemModel>>(
  (ref) => MenuNotifier(),
);
