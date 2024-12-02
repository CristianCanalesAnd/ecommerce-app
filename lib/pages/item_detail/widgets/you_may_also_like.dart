import 'package:ecommerce_app/enums/category.dart';
import 'package:ecommerce_app/models/item.dart';
import 'package:ecommerce_app/state/app_state/app_state_cubit.dart';
import 'package:ecommerce_app/widgets/custom_horizontal_list/custom_horizontal_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class YouMayAlsoLike extends StatelessWidget {
  final Category category;

  const YouMayAlsoLike({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    List<Item> items = context
        .watch<AppStateCubit>()
        .items
        .where((item) => item.category == category)
        .toList();

    return CustomHorizontalList(title: 'You may also like', items: items);
  }
}
