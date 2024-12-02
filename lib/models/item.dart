import 'package:ecommerce_app/enums/category.dart';

class Item {
  final int id;
  final String name;
  final String description;
  final String image;
  final int price;
  final String color;
  final Category category;
  final ItemSpecifications specifications;
  final int rating;
  final bool isFavorite;

  Item({
    required this.id,
    required this.name,
    this.description =
        'Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus.',
    required this.image,
    required this.price,
    required this.category,
    this.color = 'White',
    required this.specifications,
    this.rating = 4,
    required this.isFavorite,
  });

  Item copyWith({
    int? id,
    String? name,
    String? description,
    String? image,
    int? price,
    Category? category,
    ItemSpecifications? specifications,
    int? rating,
    bool? isFavorite,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
      price: price ?? this.price,
      category: category ?? this.category,
      specifications: specifications ?? this.specifications,
      rating: rating ?? this.rating,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}

class ItemSpecifications {
  final String sku;
  final String tags;
  final String dimensions;

  const ItemSpecifications({
    required this.sku,
    required this.tags,
    required this.dimensions,
  });
}
