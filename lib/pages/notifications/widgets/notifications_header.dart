import 'package:ecommerce_app/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class NotificationsHeader extends StatelessWidget {
  const NotificationsHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        'Notifications',
        style: AppTextStyle.bold(fontSize: 32),
      ),
    );
  }
}
