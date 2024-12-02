import 'package:ecommerce_app/models/item.dart';
import 'package:ecommerce_app/widgets/custom_vertical_list/widgets/vertical_list_item.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  final List<Item> items;

  const Body({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: items.map((item) => VerticalListItem(item: item)).toList(),
    );
  }
}
