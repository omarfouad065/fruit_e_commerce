import 'package:fruit_e_commerce/features/home/domain/entities/cart_item_entity.dart';

import 'item.dart';

class ItemList {
  List<ItemEntity>? items;

  ItemList({this.items});

  factory ItemList.fromEnity({required List<CartItemEntity> items}) {
    return ItemList(items: items.map((e) => ItemEntity.fromEntity(e)).toList());
  }

  Map<String, dynamic> toJson() => {
        'items': items?.map((e) => e.toJson()).toList(),
      };
}
