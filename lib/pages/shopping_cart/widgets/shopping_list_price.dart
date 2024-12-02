import 'package:ecommerce_app/theme/app_colors.dart';
import 'package:ecommerce_app/theme/app_text_style.dart';
import 'package:ecommerce_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ShoppingListPrice extends StatefulWidget {
  final int shopItemsPrice;

  const ShoppingListPrice({
    super.key,
    required this.shopItemsPrice,
  });

  @override
  State<ShoppingListPrice> createState() => _ShoppingListPriceState();
}

class _ShoppingListPriceState extends State<ShoppingListPrice> {
  double shippingFee = 6.99;
  double get total => shippingFee + widget.shopItemsPrice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          buildShippingFee(),
          const SizedBox(height: 5),
          buildSubTotal(),
          const SizedBox(height: 5),
          buildTotal(),
          const SizedBox(height: 15),
          buildCheckoutButton()
        ],
      ),
    );
  }

  Widget buildShippingFee() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Shipping free',
          style: AppTextStyle.regular(
            color: AppColors.dark.withOpacity(.5),
            fontSize: 20,
          ),
        ),
        Text(
          "\$$shippingFee",
          style: AppTextStyle.regular(
            color: AppColors.dark.withOpacity(.5),
            fontSize: 20,
          ),
        )
      ],
    );
  }

  Widget buildSubTotal() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Sub total',
          style: AppTextStyle.regular(
            color: AppColors.dark.withOpacity(.5),
            fontSize: 20,
          ),
        ),
        Text(
          "\$${widget.shopItemsPrice}",
          style: AppTextStyle.regular(
            color: AppColors.dark.withOpacity(.5),
            fontSize: 20,
          ),
        )
      ],
    );
  }

  Widget buildTotal() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Total',
          style: AppTextStyle.bold(
            color: AppColors.dark.withOpacity(.6),
            fontSize: 20,
          ),
        ),
        Text(
          "\$$total",
          style: AppTextStyle.bold(
            color: AppColors.dark.withOpacity(.6),
            fontSize: 20,
          ),
        )
      ],
    );
  }

  Widget buildCheckoutButton() {
    return SizedBox(
      width: double.infinity,
      child: CustomButton(
        title: 'CHECKOUT',
        onPressed: () {},
      ),
    );
  }
}
