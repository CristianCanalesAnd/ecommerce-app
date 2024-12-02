// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:ecommerce_app/models/shop_item.dart';
import 'package:ecommerce_app/pages/shopping_cart/widgets/shopping_list.dart';
import 'package:ecommerce_app/pages/shopping_cart/widgets/shopping_list_price.dart';
import 'package:flutter/material.dart';

class ShoppingCartBody extends StatelessWidget {
  final List<ShopItem> shopItems;
  const ShoppingCartBody({
    super.key,
    required this.shopItems,
  });

  @override
  Widget build(BuildContext context) {
    int shopItemsPrice = shopItems.map((e) => e.item.price * e.quantity).sum;

    return Flexible(
      child: Column(
        children: [
          ShoppingList(shopItems: shopItems),
          ShoppingListPrice(shopItemsPrice: shopItemsPrice),
        ],
      ),
    );
  }
}
