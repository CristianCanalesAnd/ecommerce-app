import 'package:ecommerce_app/data/data.dart';
import 'package:ecommerce_app/enums/category.dart';
import 'package:ecommerce_app/models/item.dart';
import 'package:ecommerce_app/models/shop_item.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_state_state.dart';

class AppStateCubit extends Cubit<AppStateState> {
  AppStateCubit() : super(AppStateState.initial());

  List<Item> get items => state.items;
  List<Item> itemsByCategory(Category category) =>
      items.where((item) => item.category == category).toList();
  List<Item> get favoriteItems =>
      items.where((item) => item.isFavorite).toList();
  List<ShopItem> get shopItems => state.shopItems;

  void updateFavorites(BuildContext context, Item item) {
    int index = items.indexWhere((e) => e.id == item.id);
    List<Item> updatedItems = List.of(items)..[index] = item;
    emit(state.copyWith(items: updatedItems));

    SnackBar snackBar = SnackBar(
      content: Text(
        item.isFavorite
            ? 'Item added to favorites'
            : 'Item removed from favorites',
      ),
      duration: const Duration(seconds: 1),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void addItemToCart(BuildContext context, Item item) {
    increaseItem(item);

    SnackBar snackBar = const SnackBar(
      content: Text('Added to cart'),
      duration: Duration(seconds: 1),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void increaseItem(Item item) {
    print("increaseItem");

    List<ShopItem> shopItemsCopy = List.of(shopItems);
    int index = shopItemsCopy.indexWhere((e) => e.item.id == item.id);

    if (index == -1) {
      shopItemsCopy.add(ShopItem(item: item, quantity: 1));
    } else {
      shopItemsCopy[index] = ShopItem(
        item: shopItemsCopy[index].item,
        quantity: shopItemsCopy[index].quantity + 1,
      );
    }

    emit(state.copyWith(shopItems: shopItemsCopy));
  }

  void removeItem(Item item) {
    print("removeItem");

    List<ShopItem> shopItemsCopy = List.of(shopItems);
    int index = shopItemsCopy.indexWhere((e) => e.item.id == item.id);

    ShopItem shopItemToDelete = shopItemsCopy[index];
    int quantity = shopItemToDelete.quantity - 1;

    if (quantity == 0) {
      shopItemsCopy.removeAt(index);
    } else {
      shopItemsCopy[index] = shopItemsCopy[index].copyWith(quantity: quantity);
    }

    emit(state.copyWith(shopItems: shopItemsCopy));
  }
}
