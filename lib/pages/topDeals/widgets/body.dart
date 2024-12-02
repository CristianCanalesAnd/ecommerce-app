import 'package:flutter/material.dart';

import 'chairs_list.dart';
import 'lamps_list.dart';
import 'tables_list.dart';
import 'top_deals.dart';

class Body extends StatelessWidget {
  final List<Map<String, dynamic>> topDeals;
  final int indexSelected;
  final PageController pageController;
  final Function(int) onDotPressed;
  final Function(int) onPageChanged;

  const Body({
    super.key,
    required this.topDeals,
    required this.indexSelected,
    required this.pageController,
    required this.onDotPressed,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TopDeals(
          pageController: pageController,
          topDeals: topDeals,
          indexSelected: indexSelected,
          onDotPressed: onDotPressed,
          onPageChanged: onPageChanged,
        ),
        const SizedBox(height: 30),
        const ChairsList(),
        const SizedBox(height: 30),
        const LampsList(),
        const SizedBox(height: 30),
        const TablesList(),
      ],
    );
  }
}
