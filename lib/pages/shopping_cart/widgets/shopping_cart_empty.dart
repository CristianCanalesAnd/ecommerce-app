import 'package:ecommerce_app/theme/app_colors.dart';
import 'package:ecommerce_app/theme/app_text_style.dart';
import 'package:ecommerce_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ShoppingCartEmpty extends StatelessWidget {
  const ShoppingCartEmpty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildImage(),
            const SizedBox(height: 30),
            Text(
              'Your shopping cart is empty',
              style: AppTextStyle.regular(
                color: AppColors.dark.withOpacity(.5),
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Fortunately, there's an easy solution.",
              style: AppTextStyle.bold(
                color: AppColors.dark,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 30),
            buildGoShoppingButton(context)
          ],
        ),
      ),
    );
  }

  Widget buildImage() {
    return Image.asset(
      'assets/images/empty_shop_cart.png',
      height: 300,
    );
  }

  Widget buildGoShoppingButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CustomButton(
        title: 'Go Shopping',
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
