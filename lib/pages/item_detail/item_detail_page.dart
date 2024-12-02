import 'package:ecommerce_app/models/item.dart';
import 'package:ecommerce_app/pages/favorites/favorites_page.dart';
import 'package:ecommerce_app/pages/shopping_cart/shopping_cart_page.dart';
import 'package:ecommerce_app/theme/app_colors.dart';
import 'package:ecommerce_app/theme/app_text_style.dart';
import 'package:ecommerce_app/widgets/custom_appbar_icon.dart';
import 'package:flutter/material.dart';

import 'widgets/body.dart';

class ItemDetailPage extends StatelessWidget {
  final Item item;

  const ItemDetailPage({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.light,
      appBar: buildAppBar(context),
      body: Body(item: item),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        item.category.localizedTitlePlural,
        style: AppTextStyle.semiBold(
          fontSize: 26,
        ),
      ),
      actions: [
        CustomAppBarIcon(
          image: 'assets/images/cart.png',
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const ShoppingCartPage()),
            );
          },
        ),
        CustomAppBarIcon(
          image: 'assets/images/favorite.png',
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const FavoritesPage()),
            );
          },
        ),
      ],
    );
  }
}
