import 'package:fruit_e_commerce/core/repos/orders_repo/orders_repo.dart';
import 'package:fruit_e_commerce/core/repos/orders_repo/orders_repo_impl.dart';
import 'package:fruit_e_commerce/core/repos/products_repo/products_repo.dart';
import 'package:fruit_e_commerce/core/repos/products_repo/products_repo_impl.dart';
import 'package:fruit_e_commerce/core/services/data_service,.dart';
import 'package:fruit_e_commerce/core/services/firebase_auth_service.dart';
import 'package:fruit_e_commerce/core/services/firestore_service.dart';
import 'package:fruit_e_commerce/features/auth/data/repos/auth_repo_impl.dart';
import 'package:fruit_e_commerce/features/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DatabaseService>(FirestoreService());
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(
    firebaseAuthService: getIt<FirebaseAuthService>(),
    databaseService: getIt<DatabaseService>(),
  ));

  getIt.registerSingleton<ProductsRepo>(
      ProductsRepoImpl(getIt<DatabaseService>()));

  getIt.registerSingleton<OrdersRepo>(OrdersRepoImpl(getIt<DatabaseService>()));
}
