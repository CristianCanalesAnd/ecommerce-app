import 'package:flutter/material.dart';
import 'package:ecommerce_app/enums/category.dart';
import 'package:ecommerce_app/state/app_state/app_state_cubit.dart';
import 'package:ecommerce_app/models/item.dart';
import 'package:ecommerce_app/widgets/custom_horizontal_list/custom_horizontal_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewArrivals extends StatelessWidget {
  const NewArrivals({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Item> items = context
        .watch<AppStateCubit>()
        .items
        .where((i) => [Category.chair, Category.desk].contains(i.category))
        .toList();

    return CustomHorizontalList(
      title: 'New Arrivals',
      items: items,
    );
  }
}
