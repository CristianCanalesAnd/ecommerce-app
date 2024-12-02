part of 'app_state_cubit.dart';

class AppStateState extends Equatable {
  final List<Item> items;
  final List<ShopItem> shopItems;

  const AppStateState({
    required this.items,
    required this.shopItems,
  });

  factory AppStateState.initial() {
    return AppStateState(
      items: defaultItems,
      shopItems: const [],
    );
  }

  AppStateState copyWith({
    List<Item>? items,
    List<ShopItem>? shopItems,
  }) {
    return AppStateState(
      items: items ?? this.items,
      shopItems: shopItems ?? this.shopItems,
    );
  }

  @override
  List<Object> get props => [items, shopItems];
}
