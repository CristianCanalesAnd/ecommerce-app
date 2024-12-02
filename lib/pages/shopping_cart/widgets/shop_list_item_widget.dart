import 'package:ecommerce_app/models/item.dart';
import 'package:ecommerce_app/models/shop_item.dart';
import 'package:ecommerce_app/state/app_state/app_state_cubit.dart';
import 'package:ecommerce_app/theme/app_colors.dart';
import 'package:ecommerce_app/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopListItemWidget extends StatefulWidget {
  final ShopItem shopItem;

  const ShopListItemWidget({
    super.key,
    required this.shopItem,
  });

  @override
  State<ShopListItemWidget> createState() => _ShopListItemWidgetState();
}

class _ShopListItemWidgetState extends State<ShopListItemWidget> {
  Item get item => widget.shopItem.item;
  int get quantity => widget.shopItem.quantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildImage(),
        const SizedBox(width: 20),
        Flexible(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: .5,
                  color: AppColors.gray2,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildNameLabel(),
                const SizedBox(height: 5),
                buildSize(),
                const SizedBox(height: 15),
                buildPrice(),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget buildImage() {
    return Image.asset(
      item.image,
      height: 100,
    );
  }

  Widget buildNameLabel() {
    return Text(
      item.name,
      style: AppTextStyle.bold(fontSize: 18),
    );
  }

  Widget buildSize() {
    return Row(
      children: [
        Text(
          'Size:',
          style: AppTextStyle.regular(fontSize: 18),
        ),
        const SizedBox(width: 5),
        Text(
          item.specifications.dimensions,
          style: AppTextStyle.semiBold(
            color: AppColors.dark.withOpacity(.5),
            fontSize: 18,
          ),
        ),
      ],
    );
  }

  Widget buildPrice() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "\$${item.price}",
          style: AppTextStyle.bold(fontSize: 20),
        ),
        buildQuantityControls()
      ],
    );
  }

  Widget buildQuantityControls() {
    return Row(
      children: [
        buildQuantityControl(
          image: 'assets/images/minus.png',
          onTap: () => context.read<AppStateCubit>().removeItem(item),
        ),
        Text(
          "$quantity",
          style: AppTextStyle.bold(fontSize: 28),
        ),
        buildQuantityControl(
          image: 'assets/images/plus.png',
          onTap: () => context.read<AppStateCubit>().increaseItem(item),
        ),
      ],
    );
  }

  Widget buildQuantityControl({
    required String image,
    required Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: const BoxDecoration(
            color: AppColors.dark,
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            image,
            color: AppColors.light,
            height: 20,
          ),
        ),
      ),
    );
  }
}
