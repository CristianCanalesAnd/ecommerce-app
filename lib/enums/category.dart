enum Category {
  furniture,
  chair,
  sofa,
  table,
  desk,
  lamp;

  String get id {
    switch (this) {
      case Category.chair:
        return 'Chair';
      case Category.sofa:
        return 'Sofa';
      case Category.table:
        return 'Table';
      case Category.desk:
        return 'Desk';
      case Category.lamp:
        return 'Lamp';
      case Category.furniture:
        return 'Furniture';
    }
  }

  String get localizedTitle {
    switch (this) {
      case Category.chair:
        return 'Chair';
      case Category.sofa:
        return 'Sofa';
      case Category.table:
        return 'Table';
      case Category.desk:
        return 'Desk';
      case Category.lamp:
        return 'Lamp';
      case Category.furniture:
        return 'Furniture';
    }
  }

  String get localizedTitlePlural {
    switch (this) {
      case Category.chair:
        return 'Chairs';
      case Category.sofa:
        return 'Sofas';
      case Category.table:
        return 'Tables';
      case Category.desk:
        return 'Desks';
      case Category.lamp:
        return 'Lamps';
      case Category.furniture:
        return 'Furniture';
    }
  }

  static Category fromString(String id) {
    return Category.values
        .firstWhere((e) => id == id, orElse: () => Category.furniture);
  }
}
