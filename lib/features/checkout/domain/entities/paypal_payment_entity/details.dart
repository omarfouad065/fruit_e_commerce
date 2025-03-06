import 'package:fruit_e_commerce/features/checkout/domain/entities/order_entity.dart';

class DetailsEntity {
  String? subtotal;
  num? shipping;
  int? shippingDiscount;

  DetailsEntity({this.subtotal, this.shipping, this.shippingDiscount});

  Map<String, dynamic> toJson() => {
        'subtotal': subtotal,
        'shipping': shipping,
        'shipping_discount': shippingDiscount,
      };

  factory DetailsEntity.fromEntity(OrderEntity entity) => DetailsEntity(
        subtotal: entity.cartEntity.calculateTotalPrice().toString(),
        shipping: entity.calculateShippingCost(),
        shippingDiscount: entity.calculateShippingDiscount().toInt(),
      );
}
