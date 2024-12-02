import 'package:ecommerce_app/models/item.dart';
import 'package:ecommerce_app/pages/item_detail/item_detail_page.dart';
import 'package:ecommerce_app/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class HorizontalListItem extends StatefulWidget {
  final Item item;

  const HorizontalListItem({
    super.key,
    required this.item,
  });

  @override
  State<HorizontalListItem> createState() => _HorizontalListItemState();
}

class _HorizontalListItemState extends State<HorizontalListItem> {
  double size = 180;
  Item get item => widget.item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ItemDetailPage(item: item)),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: SizedBox(
          width: size,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildImageContainer(),
              const SizedBox(height: 10),
              buildNameLabel(),
              const SizedBox(height: 5),
              buildPriceLabel(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImageContainer() {
    return Stack(
      children: [buildImage(), buildFavoriteIcon()],
    );
  }

  Widget buildImage() {
    return Image.asset(
      item.image,
      width: size,
    );
  }

  Widget buildFavoriteIcon() {
    return Positioned(
      top: 5,
      right: 5,
      child: Image.asset(
        item.isFavorite
            ? 'assets/images/favorite.png'
            : 'assets/images/favorite_deactive.png',
        width: 25,
      ),
    );
  }

  Widget buildNameLabel() {
    return Text(
      item.name,
      style: AppTextStyle.bold(
        fontSize: 18,
      ),
      maxLines: 1,
    );
  }

  Widget buildPriceLabel() {
    return Text(
      '\$${item.price}',
      style: AppTextStyle.regular(fontSize: 16),
    );
  }
}
