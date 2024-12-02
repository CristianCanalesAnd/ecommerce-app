import 'package:ecommerce_app/enums/category.dart';
import 'package:ecommerce_app/models/item.dart';
import 'package:ecommerce_app/state/app_state/app_state_cubit.dart';
import 'package:ecommerce_app/widgets/custom_vertical_list/custom_vertical_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChairsList extends StatelessWidget {
  const ChairsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Category category = Category.chair;
    List<Item> items = context
        .read<AppStateCubit>()
        .items
        .where((i) => i.category == category)
        .toList();

    return CustomVerticalList(
      title: category.localizedTitlePlural,
      items: items,
    );
  }
}
