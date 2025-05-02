// ignore_for_file: public_member_api_docs, sort_constructors_first
class MenuItemModel {
  final String name;
  final double price;
  int quantity;
  bool isAdded;

  MenuItemModel({
    required this.name,
    required this.price,
    this.quantity = 1,
    this.isAdded = false,
  });

  MenuItemModel copyWith({
    String? name,
    double? price,
    int? quantity,
    bool? isAdded,
  }) {
    return MenuItemModel(
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      isAdded: isAdded ?? this.isAdded,
    );
  }
}
