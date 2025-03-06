import 'package:dartz/dartz.dart';
import 'package:fruit_e_commerce/core/errors/failures.dart';
import 'package:fruit_e_commerce/core/repos/orders_repo/orders_repo.dart';
import 'package:fruit_e_commerce/core/services/data_service,.dart';
import 'package:fruit_e_commerce/core/utils/backend_endpoint.dart';
import 'package:fruit_e_commerce/features/checkout/data/models/order_model.dart';

import 'package:fruit_e_commerce/features/checkout/domain/entities/order_entity.dart';

class OrdersRepoImpl implements OrdersRepo {
  final DatabaseService firestoreService;

  OrdersRepoImpl(this.firestoreService);
  @override
  Future<Either<Failure, void>> addOrder({required OrderEntity order}) async {
    try {
      await firestoreService.addData(
          path: BackendEndpoint.addOrder,
          data: OrderModel.fromEntity(order).toJson());
      return right(null);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
