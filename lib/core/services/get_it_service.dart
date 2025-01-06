import 'package:gac/core/repos/cart_repo/cart_repo.dart';
import 'package:gac/core/repos/cart_repo/cart_repo_impl.dart';
import 'package:gac/core/repos/orders_repo/orders_repo.dart';
import 'package:gac/core/repos/orders_repo/orders_repo_impl.dart';
import 'package:gac/core/repos/products_repo/products_repo.dart';
import 'package:gac/core/repos/products_repo/products_repo_impl.dart';
import 'package:gac/core/services/database_service.dart';
import 'package:gac/core/services/firebase_auth_service.dart';
import 'package:gac/core/services/firestore_service.dart';
import 'package:gac/features/auth/data/repos/auth_repo_impl.dart';
import 'package:gac/features/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DatabaseService>(FireStoreService());

  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthService: getIt<FirebaseAuthService>(),
      databaseService: getIt<DatabaseService>(),
    ),
  );

  getIt.registerSingleton<ProductsRepo>(
    ProductsRepoImpl(
      
      databaseService: getIt<DatabaseService>(),
    ),
  );

   getIt.registerSingleton<CartRepo>(
    CartRepoImpl(
      
      databaseService: getIt<DatabaseService>(),
    ),
  );

   getIt.registerSingleton<OrdersRepo>(
    OrdersRepoImpl(
      
      databaseService: getIt<DatabaseService>(),
    ),
  );
}
