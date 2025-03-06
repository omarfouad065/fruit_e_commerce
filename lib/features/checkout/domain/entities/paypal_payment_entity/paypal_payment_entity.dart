import 'package:fruit_e_commerce/features/checkout/domain/entities/order_entity.dart';

import 'amount.dart';
import 'item_list.dart';

class PaypalPaymentEntity {
  Amount? amount;
  String? description;
  ItemList? itemList;

  PaypalPaymentEntity({this.amount, this.description, this.itemList});

  factory PaypalPaymentEntity.fromEntity(OrderEntity entity) =>
      PaypalPaymentEntity(
        amount: Amount.fromEntity(entity),
        description: 'Payment Description',
        itemList: ItemList.fromEnity(items: entity.cartEntity.cartItems),
      );

  toJson() => {
        'amount': amount?.toJson(),
        'description': description,
        'item_list': itemList?.toJson(),
      };
}
