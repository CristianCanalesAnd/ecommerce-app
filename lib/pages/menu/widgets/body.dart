import 'package:flutter/material.dart';

import 'menu_header.dart';
import 'menu_options.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        MenuHeader(),
        SizedBox(height: 40),
        MenuOptions(),
      ],
    );
  }
}
