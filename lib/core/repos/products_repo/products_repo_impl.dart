import 'package:dartz/dartz.dart';
import 'package:fruit_e_commerce/core/entities/product_entity.dart';
import 'package:fruit_e_commerce/core/errors/failures.dart';
import 'package:fruit_e_commerce/core/models/product_model.dart';
import 'package:fruit_e_commerce/core/repos/products_repo/products_repo.dart';
import 'package:fruit_e_commerce/core/services/data_service,.dart';
import 'package:fruit_e_commerce/core/utils/backend_endpoint.dart';

class ProductsRepoImpl extends ProductsRepo {
  final DatabaseService databaseService;

  ProductsRepoImpl(this.databaseService);
  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProduct() async {
    try {
      var data = await databaseService.getData(
          path: BackendEndpoint.getProduct,
          query: {
            'limit': 10,
            'orderBy': 'sellingCount',
            'descending': true
          }) as List<Map<String, dynamic>>;

      List<ProductEntity> products =
          data.map((e) => ProductModel.fromJson(e).toEntity()).toList();
      return right(products);
    } catch (e) {
      return left(ServerFailure('Failed to get products'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProduct() async {
    try {
      var data = await databaseService.getData(path: BackendEndpoint.getProduct)
          as List<Map<String, dynamic>>;

      List<ProductEntity> products =
          data.map((e) => ProductModel.fromJson(e).toEntity()).toList();

      return right(products);
    } catch (e) {
      return left(ServerFailure('Failed to get products'));
    }
  }
}
