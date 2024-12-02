import 'package:ecommerce_app/pages/favorites/favorites_page.dart';
import 'package:ecommerce_app/pages/menu/menu_page.dart';
import 'package:ecommerce_app/pages/shopping_cart/shopping_cart_page.dart';
import 'package:ecommerce_app/widgets/custom_appbar_icon.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        children: [
          buildMenuIcon(),
          const Spacer(),
          buildShopListIcon(),
          buildFavoritesIcon(),
        ],
      ),
    );
  }

  Widget buildMenuIcon() {
    return CustomAppBarIcon(
      image: "assets/images/menu.png",
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const MenuPage()),
        );
      },
    );
  }

  Widget buildShopListIcon() {
    return CustomAppBarIcon(
      image: "assets/images/cart.png",
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const ShoppingCartPage()),
        );
      },
    );
  }

  Widget buildFavoritesIcon() {
    return CustomAppBarIcon(
      image: "assets/images/favorite.png",
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const FavoritesPage()),
        );
      },
    );
  }
}
