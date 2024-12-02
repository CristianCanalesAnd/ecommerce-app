import 'package:ecommerce_app/models/item.dart';
import 'package:ecommerce_app/theme/app_colors.dart';
import 'package:ecommerce_app/theme/app_text_style.dart';
import 'package:flutter/material.dart';

import 'widgets/body.dart';

class ShowAllPage extends StatelessWidget {
  final String title;
  final List<Item> items;

  const ShowAllPage({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.light,
      appBar: buildAppBar(),
      body: Body(items: items),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text(title, style: AppTextStyle.bold(fontSize: 25)),
    );
  }
}
