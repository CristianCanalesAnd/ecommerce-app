import 'package:ecommerce_app/models/item.dart';
import 'package:ecommerce_app/pages/show_all/show_all_page.dart';
import 'package:flutter/material.dart';

import 'widgets/vertical_list_body.dart';
import 'widgets/vertical_list_header.dart';

class CustomVerticalList extends StatelessWidget {
  final String title;
  final List<Item> items;

  const CustomVerticalList({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    List<Item> preItems = items.take(5).toList();

    return Column(
      children: [
        VerticalListHeader(
          title: title,
          count: items.length.toString(),
          onShowAllPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ShowAllPage(title: title, items: items),
              ),
            );
          },
        ),
        const SizedBox(height: 10),
        VerticalListBody(items: preItems),
      ],
    );
  }
}
