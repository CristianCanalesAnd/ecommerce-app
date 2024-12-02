import 'package:flutter/material.dart';

import 'best_sellers.dart';
import 'new_arrivals.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: const [
          NewArrivals(),
          SizedBox(height: 20),
          BestSellers(),
        ],
      ),
    );
  }
}
