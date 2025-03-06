import 'package:dartz/dartz.dart';
import 'package:fruit_e_commerce/core/entities/product_entity.dart';
import 'package:fruit_e_commerce/core/errors/failures.dart';

abstract class ProductsRepo {
  Future<Either<Failure, List<ProductEntity>>> getProduct();
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProduct();
}
