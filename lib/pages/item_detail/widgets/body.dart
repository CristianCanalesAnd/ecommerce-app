import 'package:ecommerce_app/state/app_state/app_state_cubit.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/models/item.dart';
import 'package:ecommerce_app/theme/app_text_style.dart';
import 'package:ecommerce_app/widgets/custom_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'specifications_widget.dart';
import 'you_may_also_like.dart';

class Body extends StatefulWidget {
  final Item item;

  const Body({
    super.key,
    required this.item,
  });

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late Item item;

  @override
  void initState() {
    setState(() {
      item = widget.item;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              buildImage(),
              buildItemContent(),
            ],
          ),
        ),
        buildAddToCartButton(),
      ],
    );
  }

  Widget buildImage() {
    return Image.asset(
      item.image,
      height: MediaQuery.of(context).size.height * 0.4,
      width: double.infinity,
    );
  }

  Widget buildItemContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: buildNameLabel(),
              ),
              buildFavoriteIcon(),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildPriceLabel(),
              buildRating(),
            ],
          ),
          buildDivider(),
          buildDescriptionLabel(),
          const SizedBox(height: 15),
          SpecificationsWidget(
            category: item.category,
            specifications: item.specifications,
          ),
          buildDivider(),
          YouMayAlsoLike(
            category: item.category,
          ),
        ],
      ),
    );
  }

  Widget buildNameLabel() {
    return Text(
      item.name,
      style: AppTextStyle.bold(
        fontSize: 32,
      ),
      maxLines: 2,
    );
  }

  Widget buildFavoriteIcon() {
    double size = 35;

    return GestureDetector(
      onTap: _onFavoritePressed,
      child: Image.asset(
        item.isFavorite
            ? 'assets/images/favorite.png'
            : 'assets/images/favorite_deactive.png',
        height: size,
        width: size,
      ),
    );
  }

  Widget buildPriceLabel() {
    return Text(
      "\$${item.price}",
      style: AppTextStyle.regular(
        fontSize: 28,
      ),
      maxLines: 2,
    );
  }

  Widget buildRating() {
    int maxRating = 5;
    return Row(
      children: List.generate(
        maxRating,
        (index) => buildStar(index < item.rating),
      ),
    );
  }

  Image buildStar(bool isActive) {
    double size = 25;

    return Image.asset(
      isActive ? 'assets/images/rating.png' : 'assets/images/rating_empty.png',
      height: size,
      width: size,
    );
  }

  Widget buildDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Divider(thickness: .5),
    );
  }

  Widget buildDescriptionLabel() {
    return Text(
      item.description,
      style: AppTextStyle.regular(
        fontSize: 22,
      ),
    );
  }

  Widget buildAddToCartButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20)
          .copyWith(bottom: 30, top: 15),
      width: double.infinity,
      child: CustomButton(
        title: 'ADD TO CART',
        onPressed: _addToCart,
      ),
    );
  }

  //Functions
  _addToCart() {
    context.read<AppStateCubit>().addItemToCart(context, item);
  }

  void _onFavoritePressed() {
    setState(() {
      item = item.copyWith(isFavorite: !item.isFavorite);
    });

    context.read<AppStateCubit>().updateFavorites(context, item);
  }
}
