import 'package:bloc/bloc.dart';
import 'package:fruit_e_commerce/core/entities/product_entity.dart';
import 'package:fruit_e_commerce/features/home/domain/entities/cart_entity.dart';
import 'package:fruit_e_commerce/features/home/domain/entities/cart_item_entity.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  CartEntity cartEntity = CartEntity([]);

  void addProduct(ProductEntity productEntity) {
    bool isProductExist = cartEntity.isExist(productEntity);

    var cartItems = cartEntity.getCartItem(productEntity);
    if (isProductExist) {
      cartItems.increasesQuantity();
    } else {
      cartEntity.addCartItem(cartItems);
    }

    emit(CartItemAdded());
  }

  void deleteCartItem(CartItemEntity cartItem) {
    cartEntity.removeCartItem(cartItem);
    emit(CartItemRemoved());
  }
}
