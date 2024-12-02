import 'package:ecommerce_app/models/item.dart';
import 'package:ecommerce_app/pages/item_detail/item_detail_page.dart';
import 'package:ecommerce_app/theme/app_colors.dart';
import 'package:ecommerce_app/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class FavoriteItem extends StatelessWidget {
  final Item item;

  const FavoriteItem({
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildImageContainer(),
          buildNameLabel(),
          buildPriceLabel(),
        ],
      ),
    );
  }

  Widget buildImageContainer() {
    return Stack(
      children: [buildImage(), buildFavoriteIcon()],
    );
  }

  Widget buildFavoriteIcon() {
    double size = 30;
    return Positioned(
      top: 10,
      right: 10,
      child: Image.asset(
        'assets/images/favorite.png',
        height: size,
        width: size,
      ),
    );
  }

  Widget buildImage() {
    double size = 200;
    return Image.asset(
      item.image,
      height: size,
      width: size,
    );
  }

  Widget buildNameLabel() {
    return Text(
      item.name,
      style: AppTextStyle.bold(
        fontSize: 22,
        //overflow: TextOverflow.ellipsis,
      ),
      maxLines: 1,
    );
  }

  Widget buildPriceLabel() {
    return Text(
      "\$${item.price}",
      style: AppTextStyle.regular(
        color: AppColors.dark.withOpacity(.7),
        fontSize: 20,
      ),
      maxLines: 1,
    );
  }
}
