import 'package:ecommerce_app/models/shop_item.dart';
import 'package:ecommerce_app/pages/shopping_cart/widgets/shop_list_item_widget.dart';
import 'package:flutter/material.dart';

class ShoppingList extends StatelessWidget {
  final List<ShopItem> shopItems;

  const ShoppingList({
    super.key,
    required this.shopItems,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView(
        children:
            shopItems.map((e) => ShopListItemWidget(shopItem: e)).toList(),
      ),
    );
  }
}
