import 'package:ecommerce_app/models/item.dart';
import 'package:flutter/material.dart';

import 'horizontal_list_item.dart';

class HorizontalListBody extends StatelessWidget {
  final List<Item> items;

  const HorizontalListBody({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    List<Item> preItems = items.take(10).toList();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:
            preItems.map((item) => HorizontalListItem(item: item)).toList(),
      ),
    );
  }
}
