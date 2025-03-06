import 'package:dartz/dartz.dart';
import 'package:fruit_e_commerce/core/errors/failures.dart';
import 'package:fruit_e_commerce/features/checkout/domain/entities/order_entity.dart';

abstract class OrdersRepo {
  Future<Either<Failure, void>> addOrder({required OrderEntity order});
}
