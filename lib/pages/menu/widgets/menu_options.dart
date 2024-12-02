import 'package:ecommerce_app/pages/categories/categories_page.dart';
import 'package:ecommerce_app/pages/notifications/notifications_page.dart';
import 'package:ecommerce_app/pages/topDeals/top_deals_page.dart';
import 'package:ecommerce_app/theme/app_colors.dart';
import 'package:ecommerce_app/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class MenuOptions extends StatelessWidget {
  const MenuOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MenuOption(
          name: 'Home',
          image: 'assets/images/settings/home.png',
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        MenuOption(
          name: 'Categories',
          image: 'assets/images/settings/categories.png',
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const CategoriesPage()),
            );
          },
        ),
        MenuOption(
          name: 'Top Deals',
          image: 'assets/images/settings/topDeals.png',
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const TopDealsPage()),
            );
          },
        ),
        MenuOption(
          name: 'Notifications',
          image: 'assets/images/settings/notifications.png',
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const NotificationsPage(),
              ),
            );
          },
        ),
        MenuOption(
          name: 'Settings',
          image: 'assets/images/settings/settings.png',
          onTap: () {
            /*Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const MenuPage()),
            );*/
          },
        ),
      ],
    );
  }
}

class MenuOption extends StatelessWidget {
  final String name;
  final String image;
  final Function() onTap;

  const MenuOption({
    super.key,
    required this.name,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppColors.gray4),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              buildIcon(),
              const SizedBox(width: 10),
              buildNameLabel(),
              const Spacer(),
              buildArrowIcon()
            ],
          ),
        ),
      ),
    );
  }

  Widget buildIcon() {
    double size = 40;
    return Image.asset(
      image,
      width: size,
      fit: BoxFit.fill,
    );
  }

  Widget buildNameLabel() {
    return Text(
      name,
      style: AppTextStyle.regular(
        fontSize: 26,
      ),
    );
  }

  Widget buildArrowIcon() {
    return const Icon(
      Icons.arrow_forward_ios,
      color: AppColors.gray2,
      size: 20,
    );
  }
}
