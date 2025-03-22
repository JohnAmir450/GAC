import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:gac/core/entities/cart_entity.dart';
import 'package:gac/core/errors/failures.dart';
import 'package:gac/core/models/cart_model.dart';

abstract class CartRepo{

  Either<Failure,Stream<List<CartEntity>>> getCartProducts({required String userId});

   Future<Either<Failure, void>> addToCart({required String userId, required CartModel cartModel,required int cartQuantity});

Future<Either<Failure,void>>  changeProductQuantity(String productId,int productQuantity);


Future<Either<Failure, void>> removeFromCart({
  required String userId,
  required  String productCode,
});

Stream<double> getProductPrice(String productCode) ;


//  Future<Either<Failure, int>> getProductQuantity(String productId);

// Future<Either<Failure, List<String>>> getProductIdByField({
//   required String field,
//   required dynamic value,
// });
}