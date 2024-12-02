import 'package:flutter/material.dart';
import 'package:ecommerce_app/theme/app_text_style.dart';
import 'package:ecommerce_app/widgets/show_all_button.dart';

class HorizontalListHeader extends StatelessWidget {
  final String title;
  final Function() onShowAllPressed;

  const HorizontalListHeader({
    super.key,
    required this.title,
    required this.onShowAllPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildTitleLabel(),
        ShowAllButton(onPressed: onShowAllPressed),
      ],
    );
  }

  Widget buildTitleLabel() {
    return Text(
      title,
      style: AppTextStyle.bold(fontSize: 25),
    );
  }
}
