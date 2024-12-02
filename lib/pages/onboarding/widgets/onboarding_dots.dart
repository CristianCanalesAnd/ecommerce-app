import 'package:ecommerce_app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class OnboardingDots extends StatelessWidget {
  final int dotsLength;
  final int indexSelected;
  final Function(int) onDotPressed;

  const OnboardingDots({
    super.key,
    required this.dotsLength,
    required this.indexSelected,
    required this.onDotPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        dotsLength,
        (index) => buildDot(index),
      ),
    );
  }

  Widget buildDot(int index) {
    return GestureDetector(
      onTap: () => onDotPressed(index),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Container(
          height: 14,
          width: 14,
          decoration: BoxDecoration(
            color: indexSelected == index ? AppColors.dark : AppColors.light,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
