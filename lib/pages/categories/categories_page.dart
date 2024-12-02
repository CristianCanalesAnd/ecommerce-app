import 'package:ecommerce_app/theme/app_colors.dart';
import 'package:ecommerce_app/theme/app_text_style.dart';
import 'package:flutter/material.dart';

import 'widgets/body.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.light,
      appBar: buildAppBar(),
      body: const Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text(
        'Categories',
        style: AppTextStyle.bold(fontSize: 20),
      ),
    );
  }
}
