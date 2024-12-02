import 'package:ecommerce_app/models/item.dart';
import 'package:ecommerce_app/pages/item_detail/item_detail_page.dart';
import 'package:ecommerce_app/theme/app_colors.dart';
import 'package:ecommerce_app/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class VerticalListItem extends StatelessWidget {
  final Item item;

  const VerticalListItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ItemDetailPage(item: item)),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15).copyWith(right: 15),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppColors.gray4),
          ),
        ),
        child: Row(
          children: [
            buildImage(),
            const SizedBox(width: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildNameLabel(),
                  const SizedBox(height: 10),
                  buildPriceLabel(),
                ],
              ),
            ),
            const Spacer(),
            buildArrow(),
          ],
        ),
      ),
    );
  }

  Widget buildImage() {
    return Image.asset(
      item.image,
      height: 110,
    );
  }

  Widget buildNameLabel() {
    return Text(
      item.name,
      style: AppTextStyle.semiBold(fontSize: 20),
      maxLines: 1,
    );
  }

  Text buildPriceLabel() {
    return Text(
      "\$${item.price}",
      style: AppTextStyle.regular(fontSize: 18),
    );
  }

  Widget buildArrow() {
    return Image.asset(
      'assets/images/arrow_right.png',
      height: 20,
    );
  }
}
