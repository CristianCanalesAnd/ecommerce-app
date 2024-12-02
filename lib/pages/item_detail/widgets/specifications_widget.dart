import 'package:ecommerce_app/enums/category.dart';
import 'package:ecommerce_app/models/item.dart';
import 'package:ecommerce_app/theme/app_colors.dart';
import 'package:ecommerce_app/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class SpecificationsWidget extends StatelessWidget {
  final Category category;
  final ItemSpecifications specifications;

  const SpecificationsWidget({
    super.key,
    required this.category,
    required this.specifications,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildSpecificationLabel(
          label: 'Sku',
          value: specifications.sku,
        ),
        buildSpecificationLabel(
          label: 'Categories',
          value: category.localizedTitlePlural,
        ),
        buildSpecificationLabel(
          label: 'Tags',
          value: specifications.tags,
        ),
        buildSpecificationLabel(
          label: 'Dimensions',
          value: specifications.dimensions,
        ),
      ],
    );
  }

  Widget buildSpecificationLabel({
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            label,
            style: AppTextStyle.regular(
              color: AppColors.dark.withOpacity(.5),
              fontSize: 24,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            value,
            style: AppTextStyle.regular(
              color: AppColors.dark.withOpacity(.5),
              fontSize: 24,
            ),
          ),
        )
      ],
    );
  }
}
