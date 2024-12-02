import 'package:ecommerce_app/models/item.dart';

class ShopItem {
  final Item item;
  final int quantity;

  ShopItem({
    required this.item,
    required this.quantity,
  });

  ShopItem copyWith({
    Item? item,
    int? quantity,
  }) {
    return ShopItem(
      item: item ?? this.item,
      quantity: quantity ?? this.quantity,
    );
  }
}
