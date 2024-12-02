import 'package:ecommerce_app/models/item.dart';
import 'package:flutter/material.dart';

import 'vertical_list_item.dart';

class VerticalListBody extends StatelessWidget {
  final List<Item> items;

  const VerticalListBody({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items.map((i) => VerticalListItem(item: i)).toList(),
    );
  }
}
