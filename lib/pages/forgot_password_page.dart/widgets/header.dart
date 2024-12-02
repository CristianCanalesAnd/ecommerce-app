import 'package:ecommerce_app/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildTitleLabel(),
      ],
    );
  }

  Widget buildTitleLabel() {
    return Text(
      'Forgot password',
      style: AppTextStyle.bold(fontSize: 32),
    );
  }
}
