import 'package:flutter/material.dart';

import 'home_content.dart';
import 'home_header.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      bottom: false,
      child: Column(
        children: [
          HomeHeader(),
          SizedBox(height: 20),
          HomeContent(),
        ],
      ),
    );
  }
}
