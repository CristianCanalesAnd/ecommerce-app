import 'package:ecommerce_app/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class SignUpHeader extends StatelessWidget {
  const SignUpHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Personal details',
          style: AppTextStyle.bold(fontSize: 34),
        ),
      ],
    );
  }
}
