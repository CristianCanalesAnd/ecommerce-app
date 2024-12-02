import 'package:ecommerce_app/theme/app_colors.dart';
import 'package:ecommerce_app/theme/app_text_style.dart';
import 'package:flutter/material.dart';

import 'widgets/body.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

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
      actions: [
        GestureDetector(
          onTap: () {
            print("Mark all as read");
          },
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              'Mark all as read',
              style: AppTextStyle.regular(
                fontSize: 18,
                color: AppColors.blue,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
