import 'package:dartz/dartz.dart';
import 'package:gac/core/entities/products_entity.dart';
import 'package:gac/core/errors/failures.dart';
import 'package:gac/core/models/product_model.dart';
import 'package:gac/core/repos/products_repo/products_repo.dart';
import 'package:gac/core/services/database_service.dart';
import 'package:gac/core/utils/backend_endpoints.dart';

class ProductsRepoImpl extends ProductsRepo {
  final DatabaseService databaseService;

  ProductsRepoImpl({required this.databaseService});
  @override
  Either<Failure, Stream<List<ProductEntity>>> getBestSellingProducts() {
    try {
      final stream = databaseService.getDataStream(
          path: BackendEndpoints.getProducts,
          query: {
            'where': 'isFeatured',
            'isEqualTo': true
          }).map((data) =>
          data.map((e) => ProductModel.fromJson(e).toEntity()).toList());

      return right(stream);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      var data = await databaseService.getData(
          path: BackendEndpoints.getProducts) as List<Map<String, dynamic>>;
      List<ProductEntity> products =
          data.map((e) => ProductModel.fromJson(e).toEntity()).toList();

      return Right(products);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Either<Failure, Stream<List<ProductEntity>>> getProductsStream(
      {Map<String, dynamic>? query}) {
    try {
      final stream = databaseService
          .getDataStream(path: BackendEndpoints.getProducts, query: query,)
          .map((data) {
        return data.map((e) => ProductModel.fromJson(e).toEntity()).toList();
      });
      return Right(stream);
    } catch (e) {
      return Left(
          ServerFailure(message: 'فشل في تحميل المنتجات، حاول مرة اخرى!'));
    }
  }

  // @override
  // Future<Either<Failure, void>> addToCart(
  //     {required String userId, required CartModel cartModel}) async {
  //   try {
  //     final productDoc = await databaseService.getData(
  //       path: 'products',
  //       documentId: cartModel.productModel.code,
  //     );

  //     // Check if the requested quantity exceeds the available stock
  //     if (productDoc['productQuantity'] <= 0) {
  //       return left(
  //         ServerFailure(
  //           message:
  //               'الكمية المطلوبة غير متوفرة الآن، الكمية المتاحة هي: (${productDoc['productQuantity']}).',
  //         ),
  //       );
  //     }
  //     final cartItem = CartModel(
  //       productModel:
  //           ProductModel.fromEntity(cartModel.productModel.toEntity()),
  //       quantity: 1,
  //     );
  //     final path = '${BackendEndpoints.getUserData}/$userId';
  //     final userRef = FirebaseFirestore.instance.doc(path);

  //     // Update the cartList array in Firestore with FieldValue.arrayUnion
  //     await userRef.update({
  //       'cartList': FieldValue.arrayUnion([cartItem.toJson()])
  //     });
  //     return const Right(null);
  //   } catch (e) {
  //     return Left(ServerFailure(message: e.toString()));
  //   }
  // }

  @override
  Future<List<ProductEntity>> searchProducts(String searchText) async {
    try {
      var data = await databaseService.searchProducts(searchText);
      return data.map((e) => ProductModel.fromJson(e).toEntity()).toList();
    } catch (e) {
      throw Exception('Failed to search products: ${e.toString()}');
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProductsByType(
      {required String productType}) async {
    try {
      var data = await databaseService.getData(
              path: BackendEndpoints.getProducts,
              query: {'where': 'productType', 'isEqualTo': productType})
          as List<Map<String, dynamic>>;
      List<ProductEntity> products =
          data.map((e) => ProductModel.fromJson(e).toEntity()).toList();

      return Right(products);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

@override
Either<Failure, Stream<List<ProductEntity>>> getProductWeights({
  required String currentProductCode,
  Map<String, dynamic>? query,
  List<Map<String, dynamic>>? whereConditions,
}) {
  try {
    final stream = databaseService.getDataStream(
      path: BackendEndpoints.getProducts,
      whereConditions: whereConditions,
    ).map((data) {
      // Convert JSON to ProductEntity
      List<ProductEntity> products = 
          data.map((e) => ProductModel.fromJson(e).toEntity()).toList();

      // Remove the product with the given code
      products.removeWhere((product) => product.code == currentProductCode);

      return products;
    });

    return Right(stream);
  } catch (e) {
    return Left(
      ServerFailure(message: 'فشل في تحميل المنتجات، حاول مرة اخرى!'),
    );
  }
}


}
