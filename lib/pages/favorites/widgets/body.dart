import 'package:ecommerce_app/models/item.dart';
import 'package:ecommerce_app/pages/favorites/widgets/favorite_item.dart';
import 'package:ecommerce_app/state/app_state/app_state_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Item> items = context.watch<AppStateCubit>().favoriteItems;

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      itemCount: items.length,
      itemBuilder: (_, index) {
        return FavoriteItem(item: items[index]);
      },
    );
  }
}
