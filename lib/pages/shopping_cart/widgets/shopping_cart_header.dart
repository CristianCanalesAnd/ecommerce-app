import 'package:ecommerce_app/theme/app_colors.dart';
import 'package:ecommerce_app/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class ShoppingCartHeader extends StatelessWidget {
  const ShoppingCartHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: .5, color: AppColors.gray2),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            Text(
              'Shopping cart',
              style: AppTextStyle.bold(fontSize: 32),
            )
          ],
        ),
      ),
    );
  }
}
