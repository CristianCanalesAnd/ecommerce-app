import 'package:ecommerce_app/theme/app_text_style.dart';
import 'package:ecommerce_app/widgets/show_all_button.dart';
import 'package:flutter/material.dart';

class VerticalListHeader extends StatelessWidget {
  final String title;
  final String count;
  final Function() onShowAllPressed;

  const VerticalListHeader({
    super.key,
    required this.title,
    required this.count,
    required this.onShowAllPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildTitleLabel(),
          ShowAllButton(onPressed: onShowAllPressed),
        ],
      ),
    );
  }

  Widget buildTitleLabel() {
    return Text(
      "$title ($count)",
      style: AppTextStyle.bold(fontSize: 25),
    );
  }
}
