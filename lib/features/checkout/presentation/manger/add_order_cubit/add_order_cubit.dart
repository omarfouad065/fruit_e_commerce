import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruit_e_commerce/core/repos/orders_repo/orders_repo.dart';
import 'package:fruit_e_commerce/features/checkout/domain/entities/order_entity.dart';

part 'add_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  AddOrderCubit(this.orderRepo) : super(AddOrderInitial());
  final OrdersRepo orderRepo;

  void addOrder({required OrderEntity order}) async {
    emit(AddOrderLoading());
    final result = await orderRepo.addOrder(order: order);
    result.fold(
      (failure) => emit(AddOrderFailure(failure.toString())),
      (success) => emit(AddOrderSuccess()),
    );
  }
}
