import 'package:fruit_e_commerce/core/entities/product_entity.dart';
import 'package:fruit_e_commerce/features/home/domain/entities/cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartItems;

  CartEntity(this.cartItems);

  addCartItem(CartItemEntity cartItemEntity) {
    cartItems.add(cartItemEntity);
  }

  removeCartItem(CartItemEntity cartItem) {
    cartItems.remove(cartItem);
  }

  double calculateTotalPrice() {
    double totalPrice = 0;

    for (var cartItem in cartItems) {
      totalPrice += cartItem.calculateTotalPrice();
    }

    return totalPrice;
  }

  bool isExist(ProductEntity product) {
    for (var cartItem in cartItems) {
      if (cartItem.productEntity == product) {
        return true;
      }
    }
    return false;
  }

  CartItemEntity getCartItem(ProductEntity product) {
    for (var cartItem in cartItems) {
      if (cartItem.productEntity == product) {
        return cartItem;
      }
    }
    return CartItemEntity(productEntity: product, quantity: 1);
  }
}
