import 'package:ecommerce_app/data/data.dart';
import 'package:ecommerce_app/theme/app_colors.dart';
import 'package:ecommerce_app/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class TopDeals extends StatelessWidget {
  final PageController pageController;
  final List<Map<String, dynamic>> topDeals;
  final int indexSelected;
  final Function(int) onDotPressed;
  final Function(int) onPageChanged;

  const TopDeals({
    super.key,
    required this.pageController,
    required this.topDeals,
    required this.indexSelected,
    required this.onDotPressed,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: topDeals[indexSelected]['color'] as Color,
      height: MediaQuery.of(context).size.height * .6,
      child: PageView.builder(
        controller: pageController,
        onPageChanged: onPageChanged,
        itemBuilder: (context, index) => TopDealItem(
          topDeal: topDeals[index],
          indexSelected: indexSelected,
          onDotPressed: onDotPressed,
        ),
      ),
    );
  }
}

class TopDealItem extends StatelessWidget {
  final Map<String, dynamic> topDeal;
  final int indexSelected;
  final Function(int) onDotPressed;

  const TopDealItem({
    super.key,
    required this.topDeal,
    required this.indexSelected,
    required this.onDotPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildImage(),
        buildDots(),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildCyberMondayLabel(),
              const SizedBox(height: 10),
              buildSaleUpLabel(),
              const SizedBox(height: 10),
              buildShopNowLabel(),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildImage() {
    return Center(
      child: Image.asset(
        topDeal['image'] as String,
        width: 300,
      ),
    );
  }

  Widget buildDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(topDeals.length, (index) => buildDot(index)),
    );
  }

  Widget buildDot(int index) {
    return GestureDetector(
      onTap: () => onDotPressed(index),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Container(
          width: 30,
          height: 12,
          decoration: BoxDecoration(
            color: indexSelected == index
                ? AppColors.dark
                : AppColors.dark.withOpacity(.2),
            borderRadius: BorderRadius.circular(40),
          ),
        ),
      ),
    );
  }

  Widget buildCyberMondayLabel() {
    return Text(
      'Cyber Monday',
      style: AppTextStyle.regular(
        color: AppColors.dark.withOpacity(.7),
        fontSize: 18,
      ),
    );
  }

  Widget buildSaleUpLabel() {
    return Text(
      'Sale Up To\n${topDeal['percentage']}% Off',
      style: AppTextStyle.bold(
        color: AppColors.dark,
        fontSize: 35,
      ),
    );
  }

  Widget buildShopNowLabel() {
    return Row(
      children: [
        Text(
          'SHOP NOW',
          style: AppTextStyle.semiBold(
            color: AppColors.dark,
            fontSize: 18,
          ).copyWith(decoration: TextDecoration.underline),
        ),
        const SizedBox(width: 5),
        Image.asset(
          'assets/images/arrow_right.png',
          width: 16,
        ),
      ],
    );
  }
}
