import 'package:ecommerce_app/enums/category.dart';
import 'package:ecommerce_app/models/item.dart';
import 'package:ecommerce_app/state/app_state/app_state_cubit.dart';
import 'package:ecommerce_app/widgets/custom_vertical_list/custom_vertical_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LampsList extends StatelessWidget {
  const LampsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Category category = Category.lamp;
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
