import 'package:flutter/material.dart';
import 'package:ecommerce_app/theme/app_text_style.dart';

class ShowAllButton extends StatelessWidget {
  final Function() onPressed;

  const ShowAllButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        children: [
          Text(
            'Show all',
            style: AppTextStyle.regular(fontSize: 20),
          ),
          const SizedBox(width: 5),
          Image.asset(
            'assets/images/arrow_right.png',
            width: 14,
          )
        ],
      ),
    );
  }
}
