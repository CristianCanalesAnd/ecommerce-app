import 'package:ecommerce_app/enums/category.dart';
import 'package:ecommerce_app/models/item.dart';
import 'package:ecommerce_app/state/app_state/app_state_cubit.dart';
import 'package:ecommerce_app/widgets/custom_vertical_list/custom_vertical_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellers extends StatelessWidget {
  const BestSellers({super.key});

  @override
  Widget build(BuildContext context) {
    List<Item> items = context
        .watch<AppStateCubit>()
        .items
        .where((i) => [Category.lamp, Category.furniture].contains(i.category))
        .toList();

    return CustomVerticalList(
      title: "Best Sellers",
      items: items,
    );
  }
}
