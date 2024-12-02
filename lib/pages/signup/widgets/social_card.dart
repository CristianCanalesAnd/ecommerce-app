import 'package:ecommerce_app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SocialCard extends StatelessWidget {
  final String image;
  final double size;

  const SocialCard({
    super.key,
    required this.image,
    this.size = 50,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        color: AppColors.gray4,
        shape: BoxShape.circle,
      ),
      child: Image.asset(image),
    );
  }
}
