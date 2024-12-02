import 'package:ecommerce_app/pages/show_all/show_all_page.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/models/item.dart';

import 'widgets/horizontal_list_body.dart';
import 'widgets/horizontal_list_header.dart';

class CustomHorizontalList extends StatelessWidget {
  final String title;
  final List<Item> items;

  const CustomHorizontalList({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          HorizontalListHeader(
            title: title,
            onShowAllPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ShowAllPage(title: title, items: items),
                ),
              );
            },
          ),
          const SizedBox(height: 15),
          HorizontalListBody(items: items),
        ],
      ),
    );
  }
}
