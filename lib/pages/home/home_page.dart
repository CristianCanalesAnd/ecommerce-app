import 'package:ecommerce_app/theme/app_colors.dart';
import 'package:flutter/material.dart';

import 'widgets/body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.light,
      body: Body(),
    );
  }
}
