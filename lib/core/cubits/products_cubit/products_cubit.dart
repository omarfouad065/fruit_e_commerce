import 'package:bloc/bloc.dart';
import 'package:fruit_e_commerce/core/entities/product_entity.dart';
import 'package:fruit_e_commerce/core/repos/products_repo/products_repo.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productsRepo) : super(ProductsInitial());

  final ProductsRepo productsRepo;
  int productsLength = 0;
  Future<void> getProducts() async {
    emit(ProductsLoading());
    final result = await productsRepo.getProduct();

    result.fold((failure) => emit(ProductsFailure(failure.message)),
        (products) => emit(ProductsSuccess(products)));
  }

  Future<void> getBestSellingProducts() async {
    emit(ProductsLoading());
    final result = await productsRepo.getBestSellingProduct();

    result.fold((failure) => emit(ProductsFailure(failure.message)),
        (products) {
      productsLength = products.length;
      emit(ProductsSuccess(products));
    });
  }
}
