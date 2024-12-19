import 'package:dartz/dartz.dart';
import 'package:gac/core/entities/products_entity.dart';
import 'package:gac/core/errors/failures.dart';
import 'package:gac/core/models/cart_model.dart';

abstract class ProductsRepo {
  Future<Either<Failure, List<ProductEntity>>> getProducts();

  Either<Failure, Stream<List<ProductEntity>>> getBestSellingProducts();

   Either<Failure, Stream<List<ProductEntity>>> getProductsStream({Map<String, dynamic>? query}) ;

   Future<Either<Failure, void>> addToCart({required String userId, required CartModel cartModel});
 Future<List<ProductEntity>> searchProducts(String searchText);
}
