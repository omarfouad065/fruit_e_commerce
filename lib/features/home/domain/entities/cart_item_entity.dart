import 'package:equatable/equatable.dart';
import 'package:fruit_e_commerce/core/entities/product_entity.dart';

class CartItemEntity extends Equatable {
  final ProductEntity productEntity;
  int quantity;
  CartItemEntity({required this.productEntity, this.quantity = 0});

  num calculateTotalPrice() {
    return productEntity.price * quantity;
  }

  num calculateTotalWeights() {
    return productEntity.unitAmount * quantity;
  }

  increasesQuantity() {
    quantity++;
  }

  decreaseQuantity() {
    quantity--;
  }

  @override
  List<Object?> get props => [productEntity];
}
