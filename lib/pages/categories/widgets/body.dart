import 'package:ecommerce_app/data/data.dart';
import 'package:ecommerce_app/enums/category.dart';
import 'package:ecommerce_app/models/item.dart';
import 'package:ecommerce_app/pages/show_all/show_all_page.dart';
import 'package:ecommerce_app/state/app_state/app_state_cubit.dart';
import 'package:ecommerce_app/theme/app_colors.dart';
import 'package:ecommerce_app/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: categories
            .map((e) => CategoryWidget(
                  category: e['category'] as Category,
                  itemsCount: e['itemsCount'] as int,
                ))
            .toList());
  }
}

class CategoryWidget extends StatelessWidget {
  final Category category;
  final int itemsCount;

  const CategoryWidget({
    super.key,
    required this.category,
    required this.itemsCount,
  });

  @override
  Widget build(BuildContext context) {
    List<Item> items = context
        .read<AppStateCubit>()
        .items
        .where((i) => i.category == category)
        .toList();

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ShowAllPage(
              title: category.localizedTitlePlural,
              items: items,
            ),
          ),
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
            buildImage(items.first),
            const SizedBox(width: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildNameLabel(),
                  const SizedBox(height: 10),
                  buildItemsCountLabel(),
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

  Widget buildImage(Item item) {
    return Image.asset(
      item.image,
      height: 110,
    );
  }

  Widget buildNameLabel() {
    return Text(
      category.localizedTitle,
      style: AppTextStyle.semiBold(fontSize: 20),
      maxLines: 1,
    );
  }

  Text buildItemsCountLabel() {
    return Text(
      "$itemsCount items",
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
