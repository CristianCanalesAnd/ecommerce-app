import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/models/shop_item.dart';
import 'package:ecommerce_app/pages/shopping_cart/widgets/shopping_cart_body.dart';
import 'package:ecommerce_app/state/app_state/app_state_cubit.dart';

import 'shopping_cart_empty.dart';
import 'shopping_cart_header.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<ShopItem> shopItems = context.watch<AppStateCubit>().shopItems;

    return SafeArea(
      child: Column(
        children: [
          const ShoppingCartHeader(),
          shopItems.isEmpty
              ? const ShoppingCartEmpty()
              : ShoppingCartBody(shopItems: shopItems)
        ],
      ),
    );
  }
}
