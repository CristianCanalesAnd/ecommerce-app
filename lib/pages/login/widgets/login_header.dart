import 'package:ecommerce_app/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class LogInHeader extends StatelessWidget {
  const LogInHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'LOGIN',
      style: AppTextStyle.semiBold(fontSize: 32),
    );
  }
}
