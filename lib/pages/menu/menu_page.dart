import 'package:ecommerce_app/theme/app_colors.dart';
import 'package:flutter/material.dart';

import 'widgets/body.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.light,
      appBar: buildAppBar(),
      body: const SafeArea(
        child: Body(),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar();
  }
}
